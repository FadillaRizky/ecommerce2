import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce2/Api/carousel/ListCarouselResponse.dart';
import 'package:flutter/material.dart';

class CarouselInfo extends StatelessWidget {
  final List<Data> listCarousel;

  const CarouselInfo({
    Key? key, required this.listCarousel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(autoPlay: true, aspectRatio: 16 / 8),
      itemCount: listCarousel.length,
      itemBuilder: (context, index, realIndex) {
        return Container(
          margin: EdgeInsets.all(5),
          child: Image.network(listCarousel[index].imgCarousel!,fit: BoxFit.fitHeight,),
        );
      },
    );
  }
}
