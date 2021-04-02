import 'package:http/http.dart' as http;
import 'package:HAMD/models/product_by_category_model.dart';
import 'dart:convert';

class ProductByCategory {
  static var client = http.Client();
  static Future fetchProductByCategory(int id) async {
    var response =
        await client.get('http://hamd.loko.uz/api/product?category_id=$id');
    print(response.request);
    if (response.statusCode == 200) {
      print('success in product category services');
      print(response.body);
      var jsonString =
          ProductByCategoryModel.fromJson(json.decode(response.body));
      return jsonString;
    } else {
      print('error in product by category services');
      print(response.reasonPhrase);
    }
  }
}
