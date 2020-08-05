import 'package:experiment/controllers/counter_controller.dart';
import 'package:experiment/controllers/global_counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final GlobalCounterController globalCounterCtrl = Get.put(GlobalCounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home page')),
      body: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GetX<CounterController>(
              // State lost when page is disposed ?
              builder: (_) => Column(
                children: <Widget>[
                  Text(
                    'Inner State: ${_.counter.value}',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  RaisedButton(
                    onPressed: () {
                      _.increment();
                      debugPrint('incremeting local counter');
                    },
                    child: Text('Increment inner state'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Obx(
              // State persist to page dispose
              () => Text(
                'Global State ${globalCounterCtrl.counter.value}',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ],
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: globalCounterCtrl.increment,
        child: Icon(Icons.add),
      ),
    );
  }
}
