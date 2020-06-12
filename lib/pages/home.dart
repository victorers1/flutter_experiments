import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker demo'),
      ),
      body: Container(
        child: Center(
          child: Text('Home page'),
        ),
      ),
    );
  }
}
