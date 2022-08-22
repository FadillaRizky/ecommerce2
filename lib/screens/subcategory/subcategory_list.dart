import 'package:ecommerce2/screens/detail_subcategory/detail_subcategory.dart';
import 'package:flutter/material.dart';

import '../../Api/category/ListSubcategoryResponse.dart';
import '../../constants.dart';

class SubCategoryList extends StatefulWidget {
  const SubCategoryList({
    Key? key,
  }) : super(key: key);

  @override
  State<SubCategoryList> createState() => _SubCategoryListState();
}

class _SubCategoryListState extends State<SubCategoryList> {
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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Expanded(
          child: GridView.builder(
            itemCount: 3,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailSubCategory()));
                },
                child: Container(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          'https://1.bp.blogspot.com/-8vIBeAloFmo/X5r-ZLgo7fI/AAAAAAAAEhg/cYjOMVm5ZW4oeYIjm3kRKyNxfZyKAs9EQCNcBGAsYHQ/w0/Electronic-Axial-Lead-Resistors-Array%2B%2528FILEminimizer%2529.jpg',
                          fit: BoxFit.fill,
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
                              'Resistor 1/4 watt',
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
                // Stack(
                //   children: [
                //     Image.network(
                //       'https://1.bp.blogspot.com/-8vIBeAloFmo/X5r-ZLgo7fI/AAAAAAAAEhg/cYjOMVm5ZW4oeYIjm3kRKyNxfZyKAs9EQCNcBGAsYHQ/w0/Electronic-Axial-Lead-Resistors-Array%2B%2528FILEminimizer%2529.jpg',
                //       fit: BoxFit.fill,
                //     ),
                //     Positioned(
                //       top: 0,
                //       left: 0,
                //       bottom: 0,
                //       right: 0,
                //       child: Container(
                //         child: Center(
                //           child: Text(
                //             'Resistor 1/4 watt',
                //             style: Constants.judulcategory,
                //           ),
                //         ),
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(15),
                //           color: Color(0x66505050),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              );
            },
          ),
        ),
      ),
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
