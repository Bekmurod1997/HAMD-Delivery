import 'package:get/get.dart';
// import 'package:HAMD/models/product_by_category_model.dart';
import 'package:HAMD/models/item_details_model.dart';
import 'package:HAMD/services/add_cart.dart';

class AddCartController extends GetxController {
  var addCardList = List<Data>().obs;
  var isLoading = true.obs;

  void fetchAddCartData(int id) async {
    print('fetching add cart data');
    try {
      isLoading(true);
      var addCard = await AddCart.addingToCard(id);

      if (addCard != null) {
        addCardList.add(addCard.data);
        print(addCard);
      }
    } finally {
      isLoading(false);
    }
  }
}
