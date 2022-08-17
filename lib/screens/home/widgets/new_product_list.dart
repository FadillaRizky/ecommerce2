import 'package:ecommerce2/constants.dart';
import 'package:ecommerce2/screens/home/detail_produk.dart';
import 'package:flutter/material.dart';

import '../../../Api/product/ListProductResponse.dart';

class NewProductList extends StatelessWidget {
  // final List<Data> data;
  final List<Data> listProduct;

  const NewProductList({
    Key? key,
    required this.listProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listProduct.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailProduk(
                  ),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  Image.network(
                    listProduct[index].imageProduct!,
                    fit: BoxFit.fill,
                    height: 100,
                    width: 200,
                  ),
                  Container(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          listProduct[index].nameProduct!,
                          style: Constants.judulproduct,overflow: TextOverflow.ellipsis,maxLines: 1,
                        ),
                        Text('Rp ' + listProduct[index].priceProduct!,style: Constants.price,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
