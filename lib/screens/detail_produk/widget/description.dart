import 'package:flutter/material.dart';

import 'detail_desc.dart';

class Description extends StatelessWidget {
  final String desc;
  final String nameProduct;

  const Description({
    Key? key,
    required this.desc, required this.nameProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Descriptions",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              desc,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            TextButton(
              onPressed: () {
                showModalBottomSheet(context: context, builder: (context)
                {
                  return DetailDesc(Desc: desc,);
                });
              },
              child: Text("Lihat selengkapnya"),
            )
          ],
        ),
      ),
    );
  }
}
