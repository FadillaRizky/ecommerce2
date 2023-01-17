import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../utils/login_pref.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  String username = "";

  @override
  void initState() {
    LoginPref.getPref().then((value) {
      setState(() {
        username = value.username!;
      });

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: EdgeInsets.fromLTRB(20, 25, 20, 20),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 5, spreadRadius: 1)
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://images.unsplash.com/photo-1657865929988-698c0fb191a1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=384&q=80',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    Text(
                      'Fullstack Developer',
                      style: TextStyle(fontSize: 24),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                      margin: EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade100),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          itemNumbers(title: 'Articles', number: '46'),
                          itemNumbers(title: 'Followers', number: '980'),
                          itemNumbers(title: 'Rating', number: '8,9'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    LoginPref.removePref().then((value) {
                      if (value) {
                        Navigator.of(context).pop();
                      }
                    });
                  },
                  child: Text('Log Out'),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.redAccent),
                  ),
                ),
              ),
            ],
          ),

          // Text('Profile Screen',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          // ElevatedButton(onPressed: (){
          //   Navigator.of(context).pop();
          // },
          //     child: Text('Pindah ke halaman awal'))
        ],
      ),
    );
  }

  Column itemNumbers({required String title, required String number}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
        ),
        Text(number),
      ],
    );
  }
}
