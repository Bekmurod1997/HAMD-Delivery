import 'dart:convert';
import 'package:HAMD/models/delivery_type_model.dart';
import 'package:HAMD/utils/my_prefs.dart';

import 'package:http/http.dart' as http;

class DeliveryType {
  static var client = http.Client();
  static Future fetchDeleveryType() async {
    final languageToken = MyPref.lang ?? '';

    var response = await client.get(
      'http://hamd.loko.uz/api/category?type=delivery',
      headers: {
        'Content-Language': MyPref.lang,
      },
    );
    print(response.request);
    if (response.statusCode == 200) {
      print('success in product category services');
      print(response.body);
      var jsonString = DeliveryTypeModel.fromJson(json.decode(response.body));
      return jsonString;
    } else {
      print('error in delivery type services');
      print(response.reasonPhrase);
    }
  }
}
