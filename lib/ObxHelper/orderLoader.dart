import 'package:get/state_manager.dart';

class OrderLoaderController extends GetxController {
  var count = 1.obs;
  var loading = false.obs;

  void onFetching() => loading.value = true;
  void onSuccess() => loading.value = false;
}
