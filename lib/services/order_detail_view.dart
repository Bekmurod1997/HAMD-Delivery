import 'dart:io';

import 'package:HAMD/models/order_detail_view_model.dart';
import 'package:HAMD/utils/my_prefs.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OrderDetailView {
  static var client = http.Client();

  static Future fetchOrderDetailView(int id) async {
    final token = MyPref.secondToken ?? '';
    final languageToken = MyPref.lang ?? '';

    var response = await client.get(
      'http://hamd.loko.uz/api/order/view?id=$id',
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
        'Content-Language': MyPref.lang
      },
    );
    print(response.request);
    if (response.statusCode == 200) {
      print('success in item OrderDetailViewModel services');
      print(response.body);
      var jsonString =
          OrderDetailViewModel.fromJson(json.decode(response.body));
      return jsonString;
    } else {
      print('error in OrderDetailViewModel services');
      print(response.reasonPhrase);
    }
  }
}
