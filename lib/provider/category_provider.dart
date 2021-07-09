import 'package:flutter/cupertino.dart';
import 'package:HAMD/services/item_category_provider.dart';
import 'package:HAMD/models/item_category.dart';
import 'package:HAMD/services/item_category.dart';

class CategoryProvider extends ChangeNotifier {
  CategoryProduct _categoryProduct = CategoryProduct(data: []);
  ItemCategoryConnectingApi _itemCategoryConnecting =
      ItemCategoryConnectingApi();

  CategoryProduct get categoryProduct => _categoryProduct;

  set categoryProduct(CategoryProduct categoryProduct) {
    _categoryProduct = categoryProduct;
    notifyListeners();
  }

  Future<void> fetchCategories() async {
    categoryProduct = await _itemCategoryConnecting.fetchItemCategories();
  }
}
