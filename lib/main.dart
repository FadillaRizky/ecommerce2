import 'package:ecommerce2/screens/detail_produk/detail_produk.dart';
import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "aplikasi ecommerce",
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
