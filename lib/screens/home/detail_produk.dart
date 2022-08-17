import 'package:flutter/material.dart';

class DetailProduk extends StatefulWidget {

  const DetailProduk({Key? key}) : super(key: key);

  @override
  State<DetailProduk> createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk> {


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.network(
            'https://www.google.com/imgres?imgurl=https%3A%2F%2Fmedia.pricebook.co.id%2Fimages%2Fproduct%2FL%2F93097_L_1.jpg&imgrefurl=https%3A%2F%2Fwww.pricebook.co.id%2FXiaomi-Redmi-9-32GB%2F40%2FPD_00093097&tbnid=ugn3wIKmgLJO3M&vet=12ahUKEwjwzeS7pc35AhXPitgFHYCwBQgQMygDegUIARDFAQ..i&docid=DFRv3pVsfqaJQM&w=800&h=800&q=hp%20redmi&ved=2ahUKEwjwzeS7pc35AhXPitgFHYCwBQgQMygDegUIARDFAQ',
            height: 400,
            width: 400,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Category'),
              Text('Nama produk'),
              Text('Harga'),
              Text('Stock'),
              SizedBox(height: 20,),
              Text('Judul Deskripsi'),
              Text('Deskripsi'),

            ],
          ),

        ],
      ),
    );
  }
}
