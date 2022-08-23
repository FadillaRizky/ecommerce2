import 'package:flutter/material.dart';

import '../../../Api/category/ListSubcategoryResponse.dart';
import '../../../constants.dart';
import '../../detail_subcategory/detail_subcategory.dart';

class ListSubcategory extends StatefulWidget {
  final List<Data> listSubcategory;

  const ListSubcategory({Key? key, required this.listSubcategory})
      : super(key: key);

  @override
  State<ListSubcategory> createState() => _ListSubcategoryState();
}

class _ListSubcategoryState extends State<ListSubcategory> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Expanded(
        child: GridView.builder(
          itemCount: widget.listSubcategory.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetailSubCategory(
                        id: widget.listSubcategory[index].idSubcategory!)));
              },
              child: Container(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        widget.listSubcategory[index].imageSubcategory!,
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
                            widget.listSubcategory[index].nameSubcategory!,
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
    );
  }
}
