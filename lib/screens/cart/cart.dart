import 'package:flutter/material.dart';
import 'package:ecommerce2/screens/cart/widgets/widgets.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: showCart(),
      ),
    );
  }

  Widget showCart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title
        Container(
          margin: EdgeInsets.only(left: 20, top: 20, bottom: 20),
          child: Text(
            "My Cart",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
        ),
        // cart list
        Expanded(
          child: showList(),
        ),
        //write notes, total price, checkout button
        Footer()
      ],
    );
  }

  // menampilkan list Cart
  Widget showList() {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        //item cart
        return Container(
          width: double.infinity,
          height: 120,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                spreadRadius: 0.5,
                blurRadius: 4,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Row(
              children: [
                Image.network(
                  "https://images.tokopedia.net/img/cache/700/hDjmkQ/2020/12/11/b662d582-3313-4236-978c-f3c19957313b.jpg",
                  width: 120,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 5, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // title and delete button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // nama produk
                            Flexible(
                              child: Text(
                                "Sharp Aquos 32 inch TV",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            //tombol hapus
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.close,
                                color: Colors.black38,
                              ),
                            ),
                          ],
                        ),

                        // qty
                        Text(
                          "Quantity : 2",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        // price label
                        Text(
                          "Price : 4",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        // edit button and price
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  "Edit",
                                  style: TextStyle(color: Colors.orange),
                                ),
                              ),
                              Text(
                                "Rp 4.000.000",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
