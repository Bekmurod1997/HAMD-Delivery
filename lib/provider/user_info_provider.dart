import 'package:HAMD/services/item_category_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:HAMD/models/code_confirm_model.dart';
import 'package:HAMD/services/profile_provider.dart';

import 'package:HAMD/models/item_category.dart';
import 'package:HAMD/services/item_category.dart';

class UserInfoProvider with ChangeNotifier {
  CodeConfirmModel _codeConfirmModel = CodeConfirmModel();
  ProfileFetchApi _profileFetch = ProfileFetchApi();

  CategoryProduct _categoryProduct = CategoryProduct(data: []);
  ItemCategoryConnectingApi _itemCategoryConnecting =
      ItemCategoryConnectingApi();

  CodeConfirmModel get codeConfirmModel => _codeConfirmModel;
  CategoryProduct get categoryProduct => _categoryProduct;

  set categoryProduct(CategoryProduct categoryProduct) {
    _categoryProduct = categoryProduct;
    notifyListeners();
  }

  set codeConfirmModel(CodeConfirmModel codeConfirmModel) {
    _codeConfirmModel = codeConfirmModel;
    notifyListeners();
  }

  Future<void> fetchAllData() async {
    codeConfirmModel = await _profileFetch.profileFetch();
    // categoryProduct = await _itemCategoryConnecting.fetchItemCategories();
  }
}
