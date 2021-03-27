import 'package:HAMD/models/item_category.dart';
import 'package:HAMD/services/item_category.dart';
import 'package:get/get.dart';

class CategoryItemController extends GetxController {
  var categoryList = List<Category>().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  void fetchCategories() async {
    try {
      isLoading(true);
      var categories = await ItemCategoryConnecting.fetchItemCategories();

      if (categories != null) {
        categoryList.assignAll(categories.data);
      }
    } finally {
      isLoading(false);
    }
  }
}
