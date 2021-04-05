import 'package:HAMD/models/plastic_card_type_model.dart';
import 'package:HAMD/services/plastic_card_type.dart';
import 'package:get/get.dart';

class PlasticCardTypeController extends GetxController {
  var plasticCardTypeList = List<Data>().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchPlasticCardType(14);
    super.onInit();
  }

  void fetchPlasticCardType(int id) async {
    print('fetching plastic card');
    try {
      isLoading(true);
      var plasticCardType = await PlasticCardType.fetchPlasticCardType(id);

      if (plasticCardType != null) {
        plasticCardTypeList.assignAll(plasticCardType.data);
        // plasticCardTypeList.clear();
        // plasticCardTypeList.add(plasticCardType.data);
        // print(productByCategory);
      }
    } finally {
      isLoading(false);
    }
  }
}
