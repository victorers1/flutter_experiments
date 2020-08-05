import 'package:get/get.dart';

class GlobalCounterController extends GetxController {
  var counter = 0.obs; // Interpreted as RxInt

  void increment() {
    counter.value++;
  }
}
