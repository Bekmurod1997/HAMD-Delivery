import 'dart:io';

import 'package:HAMD/utils/my_prefs.dart';
import 'package:http/http.dart' as http;
import 'package:HAMD/models/list_of_orders_model.dart';
import 'dart:convert';

class ListOfOrders {
  static var client = http.Client();

  static Future fetchListOfOrder() async {
    final token = MyPref.secondToken ?? '';
    var response = await client.get(
      'http://hamd.loko.uz/api/order',
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );
    print(response.request);
    if (response.statusCode == 200) {
      print('success in item ListOfOrders services');
      print(response.body);
      var jsonString = ListOfOrdersModel.fromJson(json.decode(response.body));
      return jsonString;
    } else {
      print('error in ListOfOrders services');
      print(response.reasonPhrase);
    }
  }
}
