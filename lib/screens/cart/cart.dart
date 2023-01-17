import 'package:ecommerce2/Api/api.dart';
import 'package:ecommerce2/Api/cart/ListCartResponse.dart';
import 'package:ecommerce2/screens/auth/Login.dart';
import 'package:ecommerce2/utils/alerts.dart';
import 'package:ecommerce2/utils/currency.dart';
import 'package:ecommerce2/utils/data_user.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce2/screens/cart/widgets/widgets.dart';

import '../../utils/login_pref.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  //buat variable dengan data kosong,
  //harus berupa data list cart yang berisi cart,product,qty,dll
  List<Result>? dataListCart;
  Future<ListCartResponse> listCart() async {
    //mengambil nilai dari pref
    DataUser value = await LoginPref.getPref();
    //panggil list cart berdasarkan id user
    return Api.getListCart(value.idUser!);
  }

  checkPrefBeforeCart() async {
    LoginPref.checkPref().then((value) {
      if (value != true) {
        Alerts.showMessage("Login to continue", context);
        //pushandremoveunti = menambahkan halaman baru pada tumpukan
        //pushreplacement = menambahkan halaman baru dan tidak menghapus semuanya
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
      }
    });
  }

  @override
  void initState() {
    checkPrefBeforeCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
              future: listCart(),
              builder: (context, AsyncSnapshot<ListCartResponse> snapshot) {
                if (snapshot.hasData) {
                  //isi data pada variable dataListCart
                  dataListCart = snapshot.data!.result!;
                  return showCart();
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Something wrong\n${snapshot.error}"),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              })),
    );
  }

  Widget showCart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title
        Container(
          margin: EdgeInsets.only(left: 20, top: 20, bottom: 20),
          child: Text(
            "My Cart",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
        ),
        // cart list
        Expanded(
          child: showList(),
        ),
        //write notes, total price, checkout button
        Footer()
      ],
    );
  }

  // menampilkan list Cart
  Widget showList() {
    return ListView.builder(
      itemCount: dataListCart!.length,
      itemBuilder: (context, index) {
        //item cart
        return Container(
          width: double.infinity,
          height: 120,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                spreadRadius: 0.5,
                blurRadius: 4,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Row(
              children: [
                Image.network(
                  dataListCart![index].imageProduct!,
                  width: 120,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 5, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // title and delete button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // nama produk
                            Flexible(
                              child: Text(
                               dataListCart![index].nameProduct!,
                                maxLines: 2,
                                overflow:TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            //tombol hapus
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.close,
                                color: Colors.black38,
                              ),
                            ),
                          ],
                        ),

                        // qty
                        Text(
                          "Quantity : ${dataListCart![index].quantity!}",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        // price label
                        Text(
                          "Price : ${dataListCart![index].priceProduct!}",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        // edit button and price
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  "Edit",
                                  style: TextStyle(color: Colors.orange),
                                ),
                              ),
                              Text(
                                Currency.rupiah.format((int.parse(dataListCart![index].priceProduct!) * int.parse(dataListCart![index].quantity!))) ,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
