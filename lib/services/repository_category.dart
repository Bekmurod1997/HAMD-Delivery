import 'package:provider/provider.dart';
import 'package:HAMD/provider/category_provider.dart';
import 'package:flutter/cupertino.dart';

class CategoryRepository {
  Future<void> fetchCategoryInfo(BuildContext context) async {
    CategoryProvider categoryProvider = Provider.of(context, listen: false);
    await categoryProvider.fetchCategories();
  }
}
