import 'package:get/state_manager.dart';

class CounterClass extends GetxController {
  var count = 1.obs;

  void inrcement() {
    count.value++;
  }

  void decrement() {
    if (count.value > 1) {
      count.value--;
      print(count.value);
    }
  }
}
