import 'package:flutter/cupertino.dart';
import 'package:HAMD/services/all_product_api.dart';
import 'package:HAMD/models/all_products_model.dart';

class AllProductsProvider extends ChangeNotifier {
  AllProductsModel _allProductsModel = AllProductsModel();
  AllProductsApi _allProductsApi = AllProductsApi();

  AllProductsModel get allProductModel => _allProductsModel;

  set allProductModel(AllProductsModel allProductsModel) {
    _allProductsModel = allProductsModel;
    notifyListeners();
  }

  Future<void> fetchAllproduct() async {
    allProductModel = await _allProductsApi.getAllProducts();
  }
}
