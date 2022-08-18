import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  const Footer({
    Key? key,
  }) : super(key: key);

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        // write notes
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
          margin: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 0.5,
                blurRadius: 5,
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            maxLines: 3,
            controller: TextEditingController(),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Leave a note here...",
            ),
          ),
        ),

        // total price
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Row(
            children: [
              Text("TOTAL : "),
              Text(
                "Rp 8.000.000",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),

        // checkout button
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              "Checkout",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            // style: ,
          ),
        ),
      ],
    );
  }
}
