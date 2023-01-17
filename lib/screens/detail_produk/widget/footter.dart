import 'dart:io';

import 'package:ecommerce2/Api/api.dart';
import 'package:ecommerce2/screens/auth/Login.dart';
import 'package:ecommerce2/utils/currency.dart';
import 'package:ecommerce2/utils/login_pref.dart';
import 'package:flutter/material.dart';

import '../../../utils/alerts.dart';
import '../../../utils/data_user.dart';
import '../../cart/cart.dart';

class Footer extends StatefulWidget {
  final int totalPrice, quantity;
  final bool editCart;

  final String idProduct;
  final bool isCartAvailable;

  const Footer({
    Key? key,
    required this.totalPrice,
    required this.quantity,
    this.editCart = false,
    required this.idProduct,
    required this.isCartAvailable,
  }) : super(key: key);

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  bool? isLoggedIn;

  checkPrefBeforeCart() async {
    LoginPref.checkPref().then((value) {
      setState(() {
        //isi nilai variable isLoggedIn dengan nilai value
        isLoggedIn = value;
      });
    });
  }

  addToCart() async {
    if (isLoggedIn == false) {
      Alerts.showMessage("Login to Continue", context);
      Navigator.of(context)
          .push(
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      )
          .then((value) {
        //jika kembali lagi ke halaman detail produk,maka eksekusi function ini kembali
        checkPrefBeforeCart();
      });
    }
    DataUser dataUser = await LoginPref.getPref();
    //membuat kelompok data
    //dynamic,tipe data yg dapat menampung tipe data apa saja
    Map<String, dynamic> data = {
      "id_user": dataUser.idUser!,
      "id_product": widget.idProduct,
      "quantity": widget.quantity.toString()
    };
    Api.addCart(data).then((value) {
      //muncul pesan
      Alerts.showMessage("Your item is added to cart", context);
      //pergi ke halaman cart
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CartScreen(),
        ),
      );
    });
  }

  @override
  void initState() {
    checkPrefBeforeCart();
    super.initState();
  }

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
          btnAddorUpdate(),
          SizedBox(
            width: 10,
          ),
          //pindah ke halaman cart langsung
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CartScreen(),
                ),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Colors.grey[400],
              ),
            ),
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

  ElevatedButton btnAddorUpdate() {
    if (widget.isCartAvailable == true) {
      return ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.redAccent)),
        child: Text(
          "Update cart",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
    return ElevatedButton(
      onPressed: () {
        addToCart();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.orange)),
      child: Text(
        "Add to cart",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
