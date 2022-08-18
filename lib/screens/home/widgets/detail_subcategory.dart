import 'package:flutter/material.dart';

import '../../../constants.dart';

class DetailSubCategory extends StatelessWidget {
  const DetailSubCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Text(
          'List Subcategory',
          style: TextStyle(fontSize:30,color: Colors.black),
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
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        'https://cdn-brilio-net.akamaized.net/news/2022/03/14/224971/1690856-11-hp-berbagai-merek-harga-di-bawah-rp-1-juta-tersedia-di-toko-online.jpg',
                        height: 150,
                        width: 150,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0x66505050),
                        ),
                      ),
                    ),
                  ],
                ),
              );
              // Container(
              //   child: Stack(children: [
              //     ClipRRect(
              //       borderRadius: BorderRadius.circular(10),
              //       child: Image.network(
              //         'https://cdn-brilio-net.akamaized.net/news/2022/03/14/224971/1690856-11-hp-berbagai-merek-harga-di-bawah-rp-1-juta-tersedia-di-toko-online.jpg',
              //         height: 150,
              //         width: 150,
              //         fit: BoxFit.fitHeight,
              //       ),
              //     ),
              //     Positioned(
              //         top: 0,
              //         bottom: 0,
              //         right: 0,
              //         left: 0,
              //         child: Container(
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(15),
              //             color: Color(0x66505050),
              //           ),
              //         ))
              //   ]),
              // );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        backgroundColor: Colors.orange,
        child:Icon(Icons.shopping_cart),
      ),
    );
  }
}
