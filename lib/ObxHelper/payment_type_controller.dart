import 'package:HAMD/models/payment_type_model.dart';
import 'package:HAMD/services/payment_type.dart';
import 'package:get/get.dart';

class PaymentTypeController extends GetxController {
  var paymentTypeList = List<Data>().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchPaymentType();
    super.onInit();
  }

  void fetchPaymentType() async {
    try {
      isLoading(true);
      var paymentType = await PaymentType.fetchPaymentTypes();

      if (paymentType != null) {
        paymentTypeList.assignAll(paymentType.data);
      }
    } finally {
      isLoading(false);
    }
  }
}
