import 'package:experiment/controllers/counter_controller.dart';
import 'package:get/get.dart';

class CounterBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CounterController>(() => CounterController());
  }
}
