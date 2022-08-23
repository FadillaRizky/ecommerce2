import 'package:ecommerce2/Api/api.dart';
import 'package:ecommerce2/screens/detail_produk/detail_produk.dart';
import 'package:ecommerce2/screens/detail_subcategory/widgets/ListDetailSubcategory.dart';
import 'package:flutter/material.dart';
import 'widgets/widgets.dart';
import '../../Api/category/DetailSubcategoryResponse.dart';
import '../../constants.dart';

class DetailSubCategory extends StatefulWidget {
  final String id;

  const DetailSubCategory({Key? key, required this.id,}) : super(key: key);

  @override
  State<DetailSubCategory> createState() => _DetailSubCategoryState();
}

class _DetailSubCategoryState extends State<DetailSubCategory> {
  Future<DetailSubcategoryResponse>? detailSubcategory;

  @override
  void initState() {
    detailSubcategory = Api.getDetailSubcategory(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'List Subcategory',
              style: Constants.judul2,
            ),
            Text('Resistor 1/4 watt', style: Constants.judulsubcategory,)
          ],
        ),

        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
          future: detailSubcategory,
          builder: (context,
              AsyncSnapshot<DetailSubcategoryResponse> snapshot) {
            if (snapshot.hasData) {
              return ListDetailSubcategory(
                listDetailSubcategory: snapshot.data!.data!,);
            }
            if (snapshot.hasError) {
            return Center(child: Text('Something wrong\n${snapshot.error}'),
            );
            }
            return Center(child: CircularProgressIndicator(),);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.orange,
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}

