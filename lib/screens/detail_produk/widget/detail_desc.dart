import 'package:flutter/material.dart';

class DetailDesc extends StatelessWidget {
  final String Desc;
  const DetailDesc({Key? key, required this.Desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.3,
        maxChildSize: 1,
        builder: (_, controller){
          return ListView(
            controller: controller,
            children: [
              Text(Desc),
            ],
          );
        });
  }
}
