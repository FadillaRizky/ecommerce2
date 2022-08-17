import 'package:flutter/material.dart';

import '../../../Api/feed/ListFeedsResponse.dart';

class FeedList extends StatelessWidget {
  final List<Data> listFeeds;

  const FeedList({
    Key? key,
    required this.listFeeds,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        itemCount: listFeeds.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 250,
                width: 380,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 0.5,
                        blurRadius: 0.5,
                        offset: Offset(0, 0),
                        blurStyle: BlurStyle.normal)
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
                      child: Image.network(
                        listFeeds[index].imageFeed!,
                        fit: BoxFit.cover,
                        height: 125,
                        width: double.infinity,
                      ),
                    ),
                    Container(
                      height: 125,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(listFeeds[index].titleFeed!),
                            Text(listFeeds[index].descFeed!),
                            OutlinedButton(
                              onPressed: () {},
                              child: Text('View More'),
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.orange),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          );
        },
      ),
    );
  }
}
