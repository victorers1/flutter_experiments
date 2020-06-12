import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
      ),
      body: Container(
        child: Center(
          child: Text('Home page'),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(items: [
        Icon(Icons.add, size: 30),
        Icon(Icons.list, size: 30),
        Icon(Icons.compare_arrows, size: 30),
        Icon(Icons.beenhere, size: 30),
        Icon(Icons.settings, size: 30),
      ]),
    );
  }
}
