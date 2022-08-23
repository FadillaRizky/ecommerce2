import 'package:ecommerce2/Api/api.dart';
import 'package:ecommerce2/screens/detail_subcategory/detail_subcategory.dart';
import 'package:flutter/material.dart';
import 'widget/widgets.dart';
import '../../Api/category/ListSubcategoryResponse.dart';
import '../../constants.dart';

class SubCategoryList extends StatefulWidget {
  final String id;
  const SubCategoryList({
    Key? key, required this.id,
  }) : super(key: key);

  @override
  State<SubCategoryList> createState() => _SubCategoryListState();
}

class _SubCategoryListState extends State<SubCategoryList> {
  Future<ListSubcategoryResponse>? listSubcategory;

  @override
  void initState() {
    listSubcategory = Api.getListSubcategory(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Text(
          'List Subcategory',
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
          future: listSubcategory,
          builder: (context, AsyncSnapshot<ListSubcategoryResponse> snapshot) {
            if (snapshot.hasData) {
              return ListSubcategory(listSubcategory: snapshot.data!.data!);
            }
            if (snapshot.hasError) {
              return Center(
                child: Text('something wrong\n${snapshot.error}'),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: Colors.orange,
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}
