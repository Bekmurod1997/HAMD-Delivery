import 'dart:io';

import 'package:HAMD/utils/my_prefs.dart';
import 'package:http/http.dart' as http;
import 'package:HAMD/models/platsic_card_model.dart';
import 'dart:convert';

class PlasticCard {
  static var client = http.Client();
  static Future fetchPlasticCard() async {
    final token = MyPref.secondToken ?? '';
    var response = await client.get(
      'http://hamd.loko.uz/api/card',
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );
    print('all plastic card list');
    print(response.request);
    if (response.statusCode == 200) {
      print('*********');
      print('success in all plastic cards');
      print('*********');
      print(response.body);
      var jsonString = PlasticCardModel.fromJson(json.decode(response.body));
      return jsonString;
    } else {
      print('error in all plastic cards services');
      print(response.reasonPhrase);
    }
  }
}
