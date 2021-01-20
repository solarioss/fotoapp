
import 'package:flutter/material.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
//este widget es el widget que quiere jose carlos al inicio de la pantalla es decir la pantalla home//
Widget carrusel(BuildContext context) {
  final List<String> imageList = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
  ];
  return GFCarousel(
    items: imageList.map(
          (url) {
        return Container(
          margin: EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Image.network(url, fit: BoxFit.cover, width: 1000.0),
          ),
        );
      },
    ).toList(),
    onPageChanged: (index) {
//        setState(() {
//          index;
//        });
    },
  );
}