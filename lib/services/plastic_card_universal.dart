import 'package:HAMD/models/plastic_card_type_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:HAMD/utils/my_prefs.dart';

class PlasticCardUniversal {
  static var client = http.Client();
  static Future fetchPlasticUzCard() async {
    final token = MyPref.secondToken ?? '';
    var response = await client.get(
      'http://hamd.loko.uz/api/card?type_id=14',
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );
    print(' plastic card type list');
    print(response.request);
    if (response.statusCode == 200) {
      print('*********');
      print('success in  plastic card tyoe');
      print('*********');
      print(response.body);
      var jsonString = PlaticCardTypeModel.fromJson(json.decode(response.body));
      return jsonString;
    } else {
      print('error in all plastic card type services');
      print(response.reasonPhrase);
    }
  }

  static Future fetchPlasticHumoCard() async {
    final token = MyPref.secondToken ?? '';
    var response = await client.get(
      'http://hamd.loko.uz/api/card?type_id=15',
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );
    print(' plastic card type list');
    print(response.request);
    if (response.statusCode == 200) {
      print('*********');
      print('success in  plastic card humo');
      print('*********');
      print(response.body);
      var jsonString = PlaticCardTypeModel.fromJson(json.decode(response.body));
      return jsonString;
    } else {
      print('error in all plastic card humo services');
      print(response.reasonPhrase);
    }
  }
}
