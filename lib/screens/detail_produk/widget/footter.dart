

import 'dart:io';

import 'package:ecommerce2/utils/currency.dart';
import 'package:flutter/material.dart';

import '../../cart/cart.dart';

class Footer extends StatefulWidget {
final int totalPrice ,quantity;
final bool editCart ;
final String idProduct;
  const Footer(
      {Key? key, required this.totalPrice, required this.quantity, this.editCart = false, required this.idProduct,})
      : super(key: key);

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, (Platform.isIOS) ? 20 : 10),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.grey, spreadRadius: 0.1, blurRadius: 5)
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
              ),
              Text(
                Currency.rupiah.format(widget.totalPrice),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          Expanded(
            child: SizedBox(),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.orange)),
            child: Text(
              "Add to cart",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CartScreen()));
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.grey[400])),
            child: Text(
              "Go to Cart",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}