import 'package:ecommerce2/screens/detail_produk/detail_produk.dart';
import 'package:ecommerce2/screens/subcategory/subcategory_list.dart';
import 'package:flutter/material.dart';

import '../../../Api/category/ListCategoryResponse.dart';
import '../../../constants.dart';

class CategoryList extends StatelessWidget {
  final List<Data> listCategory;

  const CategoryList({
    Key? key,
    required this.listCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listCategory.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => SubCategoryList(id: listCategory[index].idCategory!,)
              ));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      listCategory[index].imageCategory!,
                      height: 150,
                      width: 170,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    bottom: 0,
                    right: 0,
                    child: Container(
                      child: Center(
                        child: Text(
                          listCategory[index].nameCategory!,
                          style: Constants.judulcategory,
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0x66505050),
                      ),
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
