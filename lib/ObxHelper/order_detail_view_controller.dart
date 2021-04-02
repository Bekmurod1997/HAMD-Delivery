import 'package:get/get.dart';
import 'package:HAMD/models/order_detail_view_model.dart';
import 'package:HAMD/services/order_detail_view.dart';

class OrderDetailViewController extends GetxController {
  var orderDetailViewList = List<Data>().obs;
  var isLoading = true.obs;

  void fetchOrderDetailView(int id) async {
    print('fetching order detail data');
    try {
      isLoading(true);
      var orderDetailView = await OrderDetailView.fetchOrderDetailView(id);

      if (orderDetailView != null) {
        orderDetailViewList.clear();
        orderDetailViewList.add(orderDetailView.data);
        print(orderDetailView);
      }
    } finally {
      isLoading(false);
    }
  }
}
