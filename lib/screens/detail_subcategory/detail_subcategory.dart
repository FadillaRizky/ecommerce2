import 'package:ecommerce2/screens/detail_produk/detail_produk.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class DetailSubCategory extends StatefulWidget {
  const DetailSubCategory({Key? key,}) : super(key: key);

  @override
  State<DetailSubCategory> createState() => _DetailSubCategoryState();
}

class _DetailSubCategoryState extends State<DetailSubCategory> {
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
            Text('Resistor 1/4 watt',style: Constants.judulsubcategory,)
          ],
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
                // onTap: (){
                //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailProduk()));
                // },
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        child: Image.network(
                            'https://1.bp.blogspot.com/-8vIBeAloFmo/X5r-ZLgo7fI/AAAAAAAAEhg/cYjOMVm5ZW4oeYIjm3kRKyNxfZyKAs9EQCNcBGAsYHQ/w0/Electronic-Axial-Lead-Resistors-Array%2B%2528FILEminimizer%2529.jpg'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text('Resistor'), Text('200')],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.orange,
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}
