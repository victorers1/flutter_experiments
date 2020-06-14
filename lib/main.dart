import 'package:experiment/pages/home.dart';
import 'package:experiment/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/home': (context) => HomePage(),
        '/profile': (context) => ProfilePage(),
      },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Shimmer.fromColors(
          child: Text('shimmer demo'),
          baseColor: Colors.grey[400],
          highlightColor: Colors.white,
          period: Duration(seconds: 3),
        )
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Text('Home page'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: Text('Profile page'),
            ),
          ],
        ),
      ),
    );
  }
}
