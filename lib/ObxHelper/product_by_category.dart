import 'package:HAMD/models/product_by_category_model.dart';
import 'package:HAMD/services/product_by_category.dart';
import 'package:get/get.dart';

class ProductByCategoryController extends GetxController {
  var productByCategoryList = List<Data>().obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    print('this is onInit in ProductByCategory');

    fetchProductByCategory(28);
    super.onInit();
  }

  void fetchProductByCategory(int id) async {
    print('fetching products by category');
    try {
      isLoading(true);
      var productByCategory =
          await ProductByCategory.fetchProductByCategory(id);

      if (productByCategory != null) {
        productByCategoryList.assignAll(productByCategory.data);
        // productByCategoryList.clear();
        // productByCategoryList.add(productByCategory.data);
        // print(productByCategory);
      }
    } finally {
      isLoading(false);
    }
  }
}
