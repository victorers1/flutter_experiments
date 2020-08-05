import 'package:experiment/controllers/bindings/inner_counter_bind.dart';
import 'package:experiment/controllers/global_counter_controller.dart';
import 'package:experiment/pages/home.dart';
import 'package:experiment/controllers/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GetX Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/root',
      getPages: [
        GetPage(
          name: '/root',
          page: () => RootPage(),
        ),
        GetPage(name: '/home', page: () => HomePage(), binding: CounterBind()),
      ],
    );
  }
}

class RootPage extends StatelessWidget {
  final CounterController counterCtrl = Get.put(CounterController());

  _goToNext() {
    Get.to(HomePage());
  }

  _showSnackBar() {
    Get.snackbar(
      'Olá, quer saber se este widget encapsula o texto quando você escreve um título muito longo?',
      'Acho que você vai ter de procurar na documentação ou no StackOverflow porque eu não sei como fazer isso.',
      snackPosition: SnackPosition.TOP,
      icon: Icon(Icons.help),
      duration: Duration(seconds: 20),
      shouldIconPulse: false,
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    );
  }

  _showDialog() {
    Get.defaultDialog(title: 'Opa', content: Text('Deseja mesmo fazer isso?'));
  }

  _showBottomSheet() {
    Get.bottomSheet(
      Container(
        child: Wrap(
          children: <Widget>[
            Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.music_note),
                  title: Text('Music'),
                  onTap: () => {},
                ),
                ListTile(
                  leading: Icon(Icons.videocam),
                  title: Text('Video'),
                  onTap: () => {},
                )
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    final GlobalCounterController globalCounterCtrl = Get.put(GlobalCounterController());

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(onPressed: _goToNext, child: Text('Go to next')),
            RaisedButton(onPressed: _showSnackBar, child: Text('SnackBar')),
            RaisedButton(onPressed: _showDialog, child: Text('Dialog')),
            RaisedButton(onPressed: _showBottomSheet, child: Text('Bottom sheet')),
            SizedBox(height: 30),
            Obx(
              () => Text(
                'State: ${globalCounterCtrl.counter.value}',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: globalCounterCtrl.increment,
        child: Icon(Icons.add),
        tooltip: 'Increment state',
      ),
    );
  }
}
