import 'dart:io';

import 'package:ecommerce2/screens/about/about_screen.dart';
import 'package:ecommerce2/screens/feed/feeds_screen.dart';
import 'package:ecommerce2/screens/help/help_screen.dart';
import 'package:ecommerce2/screens/home/home_screen.dart';
import 'package:ecommerce2/screens/subcategory/subcategory_list.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: SafeArea(
          child: TabBarView(
            children: [
              HomeScreen(),
              FeedsScreen(),
              HelpScreen(),
              AboutScreen(),

            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          padding: (Platform.isIOS) ? EdgeInsets.only(bottom: 20) : null,
          child: TabBar(
              labelColor: Colors.orange,
              unselectedLabelColor: Colors.black45,
              indicatorColor: Colors.orange,
              tabs: [
                Tab(
                  icon: Icon(Icons.home_outlined,),
                  text: 'Home',
                ),
                Tab(
                  icon: Icon(Icons.note_outlined),
                  text: 'Feeds',
                ),
                Tab(
                  icon: Icon(Icons.help_outline),
                  text: 'Help',
                ),
                Tab(
                  icon: Icon(Icons.person_outline),
                  text: 'About',
                ),
              ]),
        ),
      ),
    );
  }
}
