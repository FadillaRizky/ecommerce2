import 'package:ecommerce2/utils/currency.dart';
import 'package:flutter/material.dart';

class DetailProductItem extends StatelessWidget {
  final String nameProduct, nameCategory, descProduct, stockProduct;
  final int priceProduct;

  const DetailProductItem({
    Key? key,
    required this.nameProduct,
    required this.nameCategory,
    required this.descProduct,
    required this.stockProduct,
    required this.priceProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(nameCategory),
                SizedBox(
                  height: 5,
                ),
                Text(
                  nameProduct,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "$stockProduct Stock Available",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.orange),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("Price"),
                Text(
                  Currency.rupiah.format(priceProduct),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
