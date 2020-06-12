import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class DefaultSwiperPage extends StatelessWidget {
  final List<String> assets = [
    'ice.jpg',
    'moon.jpg',
    'forrest.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Default swiper demo'),
      ),
      body: Center(
        child: Swiper(
          itemCount: assets.length,
          pagination: SwiperPagination(),
          layout: SwiperLayout.DEFAULT, // Item width and height not working in this layout.
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
    );
  }
}
