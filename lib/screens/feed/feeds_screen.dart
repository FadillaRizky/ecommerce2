import 'package:ecommerce2/constants.dart';
import 'package:ecommerce2/screens/feed/widgets/ListFeed.dart';
import 'package:flutter/material.dart';

import '../../Api/api.dart';
import '../../Api/feed/ListFeedsResponse.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  Future<ListFeedsResponse> dataFeeds = Api.getListFeeds();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Text(
            '  Feeds',
            style: Constants.judul2,
          ),
        ),
        FutureBuilder(
          future: dataFeeds,
          //variable yg menampung method getlistcategory pd class Api
          //kemudian untuk return nya berupa future data
          //snapshot = menampung dat response
          builder: (context, AsyncSnapshot<ListFeedsResponse> snapshot) {
            //jika snapshot memiliki data
            if (snapshot.hasData) {
              //makatampilkan listcategory  dengan membawakan data dari snapshot
              return FeedList(listFeeds: snapshot.data!.data!);
            }
            //jika snapshot memiliki error
            if (snapshot.hasError) {
              //maka tampilkan error beserta penyebab
              return Center(
                child: Text('something wrong : ${snapshot.error}  '),
              );
            }
            //jika tidak kedua nya maa muncul loading
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        //FeedList(),
      ],
    );
  }
}
