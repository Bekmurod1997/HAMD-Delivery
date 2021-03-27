import 'package:get/get.dart';
import 'package:HAMD/models/item_details_model.dart';
import 'package:HAMD/services/item_details.dart';

class ItemDetailsController extends GetxController {
  var itemDetailsList = Data().obs;
  var isLoading = true.obs;

  void fetchItemDetials(int id) async{
    print('fetching item details in controller');
    try{
      isLoading(true);
      var itemDetails = await ItemDetails.fetchItemDetails(id);
      if(itemDetails != null){
        itemDetailsList.as
      }
    }
  }
}
