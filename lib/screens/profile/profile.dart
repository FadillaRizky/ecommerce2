import 'package:ecommerce2/screens/profile/widgets/profile_card.dart';
import 'package:ecommerce2/utils/login_pref.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ProfileCard(),
          ],
        ),
      ),
    );
  }}