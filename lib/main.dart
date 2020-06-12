import 'package:experiment/pages/home.dart';
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
        '/home': (context)=> HomePage(),
      },
      initialRoute: '/home',
    );
  }
}