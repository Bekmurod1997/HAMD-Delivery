import 'package:http/http.dart' as http;
import 'package:HAMD/models/item_details_model.dart';
import 'dart:convert';

class AddCart {
  static var client = http.Client();
  static Future addingToCard(int id) async {
    var response =
        await client.get('http://hamd.loko.uz/api/product/view?id=$id');
    print(response.request);
    if (response.statusCode == 200) {
      print('success in adding cart services');
      print(response.body);
      var jsonString = ItemDetailsModel.fromJson(json.decode(response.body));
      return jsonString;
    } else {
      print('error in adding cart services');
      print(response.reasonPhrase);
    }
  }
}
