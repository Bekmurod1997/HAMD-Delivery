import 'package:get/state_manager.dart';

class FavoriteState extends GetxController {
  var favorite = false.obs;

  void doFavotie() {
    favorite.value = !favorite.value;
  }
}
