import 'dart:io';
import 'package:HAMD/models/cart_list_model.dart';
import 'package:HAMD/utils/my_prefs.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CartList {
  static var client = http.Client();
  static Future fetchCartList() async {
    final token = MyPref.secondToken ?? '';
    var response = await client.get(
      'http://hamd.loko.uz/api/cart',
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
        'Content-Language': MyPref.lang,
      },
    );
    print('all cart list');
    print(response.request);
    if (response.statusCode == 200) {
      print('*********');
      print('success in all products');
      print('*********');
      print(response.body);
      var jsonString = CartListModel.fromJson(json.decode(response.body));
      return jsonString;
    } else {
      print('error in all products services');
      print(response.reasonPhrase);
    }
  }
}
