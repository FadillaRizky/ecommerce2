import 'package:ecommerce2/constants.dart';
import 'package:ecommerce2/screens/detail_produk/detail_produk.dart';
import 'package:flutter/material.dart';

import '../../../Api/product/ListProductResponse.dart';

class NewProductList extends StatefulWidget {
  // final List<Data> data;
  final List<Data> listProduct;

  const NewProductList({
    Key? key,
    required this.listProduct,
  }) : super(key: key);

  @override
  State<NewProductList> createState() => _NewProductListState();
}

class _NewProductListState extends State<NewProductList> {
  List<Data> result = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.listProduct.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailProduk(idProduk: result[index].idProduct!,
                  ),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  Image.network(
                    widget.listProduct[index].imageProduct!,
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
                          widget.listProduct[index].nameProduct!,
                          style: Constants.judulproduct,overflow: TextOverflow.ellipsis,maxLines: 1,
                        ),
                        Text('Rp ' + widget.listProduct[index].priceProduct!,style: Constants.price,),
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
