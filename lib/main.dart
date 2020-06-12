import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:experiment/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/home': (context) => HomePage(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text('Curved navigation demo'),
        ),
        body: Container(
          color: Colors.blueAccent,
          child: Center(
            child: Text('Curved navigation demo'),
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          items: [
            Icon(Icons.add, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.compare_arrows, size: 30),
            Icon(Icons.person_outline, size: 30),
            Icon(Icons.settings, size: 30),
          ],
          onTap: (index) {
            print('Tab $index tapped');
          },
        ),
      ),
    );
  }
}
