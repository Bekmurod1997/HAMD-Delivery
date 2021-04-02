import 'package:HAMD/models/delivery_type_model.dart';
import 'package:HAMD/services/delivery_type.dart';
import 'package:get/get.dart';

class DelivertyTypeController extends GetxController {
  var deliveryTypeList = List<Data>().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchDeliveryType();
    super.onInit();
  }

  void fetchDeliveryType() async {
    try {
      isLoading(true);
      var deliveryType = await DeliveryType.fetchDeleveryType();

      if (deliveryType != null) {
        deliveryTypeList.assignAll(deliveryType.data);
      }
    } finally {
      isLoading(false);
    }
  }
}
