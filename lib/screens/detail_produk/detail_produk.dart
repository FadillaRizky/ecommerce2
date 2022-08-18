import 'package:ecommerce2/screens/detail_produk/widget/widgets.dart';
import 'package:flutter/material.dart';


import '../../Api/api.dart';
import '../../Api/product/DetailProductResponse.dart';
import '../../Api/product/ListProductResponse.dart';

class DetailProduk extends StatefulWidget {
  final String idProduk;
  const DetailProduk({Key? key, required this.idProduk}) : super(key: key);

  @override
  State<DetailProduk> createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk> {

  Widget setQuantity() {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // kurangi jumlah barang
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                shape: CircleBorder(), primary: Colors.grey[200]),
            child: Icon(
              Icons.horizontal_rule,
              size: 20,
            ),
          ),

          // untuk menampilkan berapa jumlah barang
          Text(
            "1",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          // tambahkan jumla barang
          ElevatedButton(
            onPressed: () {},
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SafeArea(
          child: Column(
            children: [
              Image.network(
                'https://lzd-img-global.slatic.net/g/p/23f796912d7313aab7ff63153af98e39.jpg_720x720q80.jpg_.webp',
                height: 320,
                width: 400,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 3,
              ),
              DetailProductItem(),
              SizedBox(
                height: 10,
              ),
              Description(),
              //add & remove item
              setQuantity(),
              SizedBox(
                height: 10,
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
