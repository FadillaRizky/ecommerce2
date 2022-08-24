import 'package:ecommerce2/utils/currency.dart';
import 'package:flutter/material.dart';

import '../../../Api/api.dart';
import '../../../Api/category/DetailSubcategoryResponse.dart';
import '../../detail_produk/detail_produk.dart';

class ListDetailSubcategory extends StatelessWidget {
  final List<Data> listDetailSubcategory;

  const ListDetailSubcategory({
    Key? key,
    required this.listDetailSubcategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Expanded(
        child: GridView.builder(
          itemCount: listDetailSubcategory.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetailProduk(
                      idProduk: listDetailSubcategory[index].idProduct!,
                    ),
                  ),
                );
              },
              child: Container(
                height: 170,
                width: 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      child: Image.network(
                        Api.IMG_URL +
                            listDetailSubcategory[index].imageProduct!,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(listDetailSubcategory[index].nameProduct!),
                          Text(Currency.rupiah.format(int.parse(
                              listDetailSubcategory[index].priceProduct!)))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
