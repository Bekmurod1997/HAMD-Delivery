import 'package:http/http.dart' as http;
import 'package:HAMD/models/item_category.dart';
import 'package:HAMD/constants/api.dart';
import 'dart:convert';

class ItemCategoryConnecting {
  static var client = http.Client();
  static Future fetchItemCategories() async {
    var response = await client.get(ApiUrl.productType);
    print(response.request);
    if (response.statusCode == 200) {
      print('success');
      print(response.body);
      var jsonString = CategoryProduct.fromJson(json.decode(response.body));
      return jsonString;
    } else {
      print(response.reasonPhrase);
    }
  }
}
