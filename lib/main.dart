import 'package:experiment/pages/default_swiper.dart';
import 'package:experiment/pages/stacked_swiper.dart';
import 'package:experiment/pages/tinder_swiper.dart';
import 'package:flutter/material.dart';

/// Testing flutter_swiper
///
/// Available on https://pub.dev/packages/flutter_swiper
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Swiper Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/default': (context) => DefaultSwiperPage(),
        '/stacked': (context) => StackedSwiperPage(),
        '/tinder': (context) => TinderSwiperPage(),
      },
      home: PageIndex(),
    );
  }
}

class PageIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('flutter_swiper demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/default');
                },
                child: Text('Default Swiper'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/stacked');
                },
                child: Text('Stacked Swiper'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/tinder');
                },
                child: Text('Tinder Swiper'),
              ),
            ],
          ),
        ));
  }
}
