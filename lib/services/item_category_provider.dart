import 'package:HAMD/models/code_confirm_model.dart';
import 'package:HAMD/utils/my_prefs.dart';
import 'package:http/http.dart' as http;
import 'package:HAMD/models/item_category.dart';
import 'package:HAMD/constants/api.dart';
import 'dart:convert';

class ItemCategoryConnectingApi {
  static var client = http.Client();

  Future<CategoryProduct> fetchItemCategories() async {
    final languageToken = MyPref.lang ?? '';
    var response = await client.get(
      ApiUrl.productType,
      headers: {
        'Content-Language': '$languageToken',
      },
    );
    print(response.request);
    if (response.statusCode == 200) {
      print('success');
      print(response.body);
      var jsonString = CategoryProduct.fromJson(json.decode(response.body));
      return jsonString;
    } else {
      print(response.reasonPhrase);
      return CategoryProduct(data: []);
    }
  }
}
