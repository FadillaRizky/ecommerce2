import 'package:ecommerce2/Api/cart/CheckCartResponse.dart';
import 'package:ecommerce2/constants.dart';
import 'package:ecommerce2/screens/detail_produk/widget/widgets.dart';
import 'package:flutter/material.dart';

import '../../Api/api.dart';
import '../../Api/product/DetailProductResponse.dart';
import '../../Api/product/ListProductResponse.dart';
import '../../utils/alerts.dart';
import '../../utils/login_pref.dart';

class DetailProduk extends StatefulWidget {
  final String idProduk;
  final bool editCart;

  const DetailProduk({Key? key, required this.idProduk, this.editCart = false})
      : super(key: key);

  @override
  State<DetailProduk> createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk> {
  late Future<DetailProductResponse>? detailProduct;
  // late Future<CheckCartResponse> CheckCart;
  // late String idUser;
  bool? isCartAvailable;

  //data product detail
  String idProduct = "",
      nameProduct = " ",
      nameCategory = " ",
      descProduct = " ",
      imageProduct = " ",
      stockProduct = " ";

  int priceProduct = 0, totalPrice = 0, quantity = 1;

  bool stopRefreshing = false;

  Widget setQuantity() {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // kurangi jumlah barang
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (quantity <= 1) {
                  return;
                }
                quantity--;
                totalPrice = priceProduct * quantity;
              });
            },
            style: ElevatedButton.styleFrom(
                shape: CircleBorder(), primary: Colors.grey[200]),
            child: Icon(
              Icons.horizontal_rule,
              size: 20,
            ),
          ),

          // untuk menampilkan berapa jumlah barang
          Text(
            quantity.toString(),
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          // tambahkan jumla barang
          ElevatedButton(
            onPressed: () {
              if (quantity == int.parse(stockProduct)) {
                Alerts.showMessage("can't add more quantity than an available stock ", context);
                return;
              }
              setState(() {
                quantity++;
                totalPrice = priceProduct * quantity;
              });
            },
            style: ElevatedButton.styleFrom(
                shape: CircleBorder(), primary: Colors.green[400]),
            child: Icon(
              Icons.add,
              size: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  checkCartUser() async {
    var dataUser = await LoginPref.getPref();

    //jika id user kosong, maka ubah status available menjadi false
    //karna tidak bisa cek keranjang ktika tidak ada id user dari pref nya
    if (dataUser.idUser == null) {
      setState(() {
        this.isCartAvailable = false;
        quantity = 1;
      });
      return;
    }
    Future<CheckCartResponse> checkCart =
        Api.checkCart(dataUser.idUser!, widget.idProduk);
    checkCart.then((value) {
      setState(() {
        // jika hasil cek keranjang tidak benilai null alias tidak kosong,maka return nilai true
        // memang null, maka return false
        this.isCartAvailable = (value.result != null) ? true : false;
        print("cart available : $isCartAvailable");
        //update quantitynya berdasarkan pada jumlah product pada keranjang
        quantity = int.parse(value.result?.quantity ?? "1");
      });
    });
  }

  @override
  void initState() {
    //request api detail produk
    detailProduct = Api.getDetailProduct(widget.idProduk);
    //cek keranjang user
    checkCartUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // isi variable context dengan context yang berasal dari build
    return Scaffold(
      body: loadingData(),
      bottomNavigationBar: Footer(
        totalPrice: totalPrice,
        quantity: quantity,
        idProduct: idProduct,
        // setelah tanda ?? digunakan ketika nilai pada iscartavailable adalah null/kosong
        //jadi,jika kosong,tetapkan iscartavailable menjadi false
        isCartAvailable: this.isCartAvailable ?? false,
      ),
    );
  }

  Widget loadingData() {
    return FutureBuilder(
      future: detailProduct,
      builder: (context, AsyncSnapshot<DetailProductResponse> snapshot) {
        // jika cart tidak ksong,dan
        //snapshot memiliki data ,dan
        //jaringan terkoneksi
        if (isCartAvailable != null &&
            snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          //buat halaman tdk bisa di refresh
          stopRefreshing = true;

          //memasukan data detail product
          var data = snapshot.data!;

          idProduct = data.idProduct!;
          nameProduct = data.nameProduct!;
          nameCategory = data.nameCategory!;
          descProduct = data.descProduct!;
          imageProduct = data.imageProduct!;
          stockProduct = data.stockProduct!;
          priceProduct = int.parse(data.priceProduct!);
          totalPrice = int.parse(data.priceProduct!);

          return showDetail();
        }

        //ketika error
        if (snapshot.hasError) {
          stopRefreshing = false;
          //tampilkan pesan oops something error dan
          // menampilkan alasan dari error tersebut
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Oops! Something wrong',
                  style: Constants.judul,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(snapshot.error.toString())
              ],
            ),
          );
        }
        //jka tdk dari kedua nya artinya snapshot masih belom ada status hasdata maupun haserror
        //maka tampilkan animasi loading
        stopRefreshing = false;
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  SingleChildScrollView showDetail() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SafeArea(
        child: Column(
          children: [
            Image.network(
              imageProduct,
              height: 320,
              width: 400,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 3,
            ),
            DetailProductItem(
              priceProduct: priceProduct,
              descProduct: descProduct,
              stockProduct: stockProduct,
              nameCategory: nameCategory,
              nameProduct: nameProduct,
            ),
            SizedBox(
              height: 10,
            ),
            Description(
              desc: descProduct,
              nameProduct: nameProduct,
            ),
            //add & remove item
            setQuantity(),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
