import 'package:get/get.dart';
import 'package:HAMD/models/cart_list_model.dart';
import 'package:HAMD/services/cart_list.dart';

class CartListController extends GetxController {
  var allCartList = List<Data>().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    print('this is onInit in CartListController');

    fetchAllCartList();
    super.onInit();
  }

  void fetchAllCartList() async {
    try {
      isLoading(true);
      var allCart = await CartList.fetchCartList();
      if (allCart != null) {
        // print('data $allCart');
        allCartList.assignAll(allCart.data);
      }
    } finally {
      isLoading(false);
    }
  }

  Future clearCart() async {
    try {
      isLoading(true);
      var allCart = await CartList.fetchCartList();
      if (allCart != null) {
        // print('data $allCart');
        // allCartList.assignAll(allCart.data);
        allCartList.clear();
      }
    } finally {
      isLoading(false);
    }
  }
  //this was added

  // void clearCart() async {
  //   allCartList.clear();
  // }
}
