import 'package:HAMD/services/list_of_orders.dart';
import 'package:get/get.dart';
import 'package:HAMD/models/list_of_orders_model.dart';

class ListOfAllOrdersControllers extends GetxController {
  var orderList = List<Data>().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchListOfOrders();
    super.onInit();
  }

  Future fetchListOfOrders() async {
    try {
      isLoading(true);
      var orders = await ListOfOrders.fetchListOfOrder();

      if (orders != null) {
        orderList.assignAll(orders.data);
      }
    } finally {
      isLoading(false);
    }
  }
}
