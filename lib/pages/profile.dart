import 'package:flutter/material.dart';

//TODO: simulate a profile page mixing shimmer and normal widgets
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Center(
        child: Text('Profile Page'),
      ),
    );
  }
}
