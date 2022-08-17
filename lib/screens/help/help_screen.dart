import 'package:flutter/material.dart';

import '../../constants.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          '  Help',
          style: Constants.judul2,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          padding: EdgeInsets.all(5),
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(width: 3,color: Colors.black12),
            borderRadius: BorderRadius.circular(10),

          ),
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network('https://image.shutterstock.com/image-vector/shipping-fast-delivery-van-icon-260nw-1145000948.jpg',fit: BoxFit.fill,)),
              SizedBox(width:20,),
              Text('Shipping',style: Constants.judul2,)
            ],
          ),
        ),
      ),
    );
  }
}
