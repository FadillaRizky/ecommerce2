import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce2/Api/carousel/ListCarouselResponse.dart';
import 'package:ecommerce2/constants.dart';
import 'package:ecommerce2/screens/home/widgets/home_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Api/api.dart';
import '../../Api/category/ListCategoryResponse.dart';
import '../../Api/product/ListProductResponse.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<ListCategoryResponse> dataCategory = Api.getListCategory();
  Future<ListProductResponse> dataProduct = Api.getListProduct();
  Future<ListCarouselResponse> dataCarousel = Api.getListCarousel();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange,
        title: Text('Toko Lauwba'),
        actions: [
          SizedBox(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.shopping_cart),
                Icon(Icons.more_vert)],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          FutureBuilder(
            future: dataCarousel,
            //variable yg menampung method getlistcategory pd class Api
            //kemudian untuk return nya berupa future data
            //snapshot = menampung dat response
            builder: (context, AsyncSnapshot<ListCarouselResponse> snapshot) {
              //jika snapshot memiliki data
              if (snapshot.hasData) {
                //makatampilkan listcategory  dengan membawakan data dari snapshot
                return CarouselInfo(listCarousel: snapshot.data!.data!);
              }
              //jika snapshot memiliki error
              if (snapshot.hasError) {
                //maka tampilkan error beserta penyebab
                return Center(
                  child: Text('something wrong : ${snapshot.error}  '),
                );
              }
              //jika tidak kedua nya maa muncul loading
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Category',
              style: Constants.judul,
            ),
          ),
          FutureBuilder(
            future: dataCategory,
            //variable yg menampung method getlistcategory pd class Api
            //kemudian untuk return nya berupa future data
            //snapshot = menampung dat response
            builder: (context, AsyncSnapshot<ListCategoryResponse> snapshot) {
              //jika snapshot memiliki data
              if (snapshot.hasData) {
                //makatampilkan listcategory  dengan membawakan data dari snapshot
                return CategoryList(listCategory: snapshot.data!.data!);
              }
              //jika snapshot memiliki error
              if (snapshot.hasError) {
                //maka tampilkan error beserta penyebab
                return Center(
                  child: Text('something wrong : ${snapshot.error}  '),
                );
              }
              //jika tidak kedua nya maa muncul loading
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'New Product',
              style: Constants.judul,
            ),
          ),
          FutureBuilder(
            future: dataProduct,
            //variable yg menampung method getlistcategory pd class Api
            //kemudian untuk return nya berupa future data
            //snapshot = menampung dat response
            builder: (context, AsyncSnapshot<ListProductResponse> snapshot) {
              //jika snapshot memiliki data
              if (snapshot.hasData) {
                //makatampilkan listcategory  dengan membawakan data dari snapshot
                return NewProductList(listProduct: snapshot.data!.data!);
              }
              //jika snapshot memiliki error
              if (snapshot.hasError) {
                //maka tampilkan error beserta penyebab
                return Center(
                  child: Text('something wrong : ${snapshot.error}  '),
                );
              }
              //jika tidak kedua nya maa muncul loading
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ]),
      ),
    );
  }
}
