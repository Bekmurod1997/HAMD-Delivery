import 'package:get/get.dart';
import 'package:HAMD/models/all_products_model.dart';
import 'package:HAMD/services/all_product.dart';

class AllProductsController extends GetxController {
  var allProductsList = List<Data>().obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    fetchAllProducts();
    super.onInit();
  }

  void fetchAllProducts() async {
    try {
      isLoading(true);
      var allProducts = await AllProducts.getAllProducts();
      if (allProducts != null) {
        allProductsList.assignAll(allProducts.data);
      }
    } finally {
      isLoading(false);
    }
  }
}
