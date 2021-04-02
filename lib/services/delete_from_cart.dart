import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:HAMD/utils/my_prefs.dart';

class DeleteFromCart {
  static var client = http.Client();
  static Future deleteFromCart(String productid) async {
    final token = MyPref.secondToken ?? '';
    var response = await client.post('http://hamd.loko.uz/api/cart/remove',
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
        body: {'product_id': productid});
    print('deleting product part');
    print(response.request);
    print(response.body);
    if (response.statusCode == 200) {
      print('*********');
      print('success in deleting products');
      print('*********');
      print(response.body);
    } else {
      print('error in deleting products services');
      print(response.reasonPhrase);
    }
  }
}
