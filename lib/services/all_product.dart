import 'package:http/http.dart' as http;
import 'package:HAMD/models/all_products_model.dart';
import 'package:HAMD/constants/api.dart';
import 'dart:convert';

class AllProducts {
  static var client = http.Client();
  static Future getAllProducts() async {
    var response = await client.get(ApiUrl.allProducts);
    print('all products');
    print(response.request);
    if (response.statusCode == 200) {
      print('*********');
      print('success in all products');
      print('*********');
      print(response.body);
      var jsonString = AllProductsModel.fromJson(json.decode(response.body));
      return jsonString;
    } else {
      print('error in all products services');
      print(response.reasonPhrase);
    }
  }
}
