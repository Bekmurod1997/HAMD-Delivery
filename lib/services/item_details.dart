import 'package:http/http.dart' as http;
import 'package:HAMD/models/item_details_model.dart';
import 'dart:convert';

class ItemDetails {
  static var client = http.Client();
  static Future fetchItemDetails(int id) async {
    var response =
        await client.get('http://hamd.loko.uz/api/product/view?id=$id');
    print(response.request);
    if (response.statusCode == 200) {
      print('success in item details services');
      print(response.body);
      var jsonString = ItemDetailsModel.fromJson(json.decode(response.body));
      return jsonString;
    } else {
      print('error in itemdetilas services');
      print(response.reasonPhrase);
    }
  }
}
