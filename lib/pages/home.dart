import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatelessWidget {
  final List<String> assets = [
    'ice.jpg',
    'moon.jpg',
    'forrest.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter_swiper demo'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Swiper(
              itemCount: assets.length,
              pagination: SwiperPagination(),
              // viewportFraction: 0.8,
              layout: SwiperLayout.STACK,
              itemWidth: 300,
              itemHeight: 300,
              itemBuilder: (BuildContext context, int index) {
                return Image.asset(
                  'assets/img/' + assets[index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),

          Expanded(
            child: Swiper(
              itemCount: assets.length,
              pagination: SwiperPagination(),
              layout: SwiperLayout.TINDER,
              itemWidth: 400,
              itemHeight: 300,
              itemBuilder: (BuildContext context, int index) {
                return Image.asset(
                  'assets/img/' + assets[index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
