import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:HAMD/provider/all_products_provider.dart';

class ProductsRepository {
  Future<void> fetchAllProducts(BuildContext context) async {
    AllProductsProvider allProductsProvider =
        Provider.of(context, listen: false);
    await allProductsProvider.fetchAllproduct();
  }
}
