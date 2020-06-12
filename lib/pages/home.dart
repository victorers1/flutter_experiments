import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File image;
  final _picker = ImagePicker();

  Future _getImageFromGallery() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    print('path: ${pickedFile.path}');
    setState(() {
      image = File(pickedFile.path);
    });
  }

  Future _getImageFromCamera() async {
    final pickedFile = await _picker.getImage(source: ImageSource.camera);
    print('path: ${pickedFile.path}');
    setState(() {
      image = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker demo'),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 20, left: 16, right: 16),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('Pick from:'),
              // SizedBox(width: 20),
              RaisedButton(
                  onPressed: _getImageFromCamera, child: Text('Camera')),
              // SizedBox(width: 20),
              RaisedButton(
                  onPressed: _getImageFromGallery, child: Text('Gallery')),
            ],
          ),
          SizedBox(height: 50),
          image != null ? Image.file(image) : Text('No image selected'),
        ],
      ),
    );
  }
}

/**
 * 
 * SingleChildScrollView(
        child: Center(
          child: Expanded(
                    child: Column(
              children: <Widget>[
                RaisedButton(onPressed: _getImageFromCamera, child: Text('Camera')),
                RaisedButton(
                    onPressed: _getImageFromGallery, child: Text('Gallery')),
                SizedBox(height: 50),
                image != null ? Image.file(image) : Text('No image selected'),
              ],
            ),
          ),
        ),
      ),
 */
