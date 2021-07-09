import 'dart:convert';
import 'package:HAMD/models/edit_plastic_card_model.dart';
import 'package:HAMD/services/plastic_card_type.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:HAMD/utils/my_prefs.dart';
import 'package:get/get.dart';

class AddPlasticCardType {
  static var client = http.Client();
  static Future addPlasticCardType(
      {int typeId,
      String cardNumber,
      String cardPhoneNumber,
      String cardExpire}) async {
    final token = MyPref.secondToken ?? '';
    var response =
        await client.post('http://hamd.loko.uz/api/card/send', headers: {
      HttpHeaders.authorizationHeader: 'Bearer $token'
    }, body: {
      'type_id': typeId.toString(),
      'card_number': cardNumber,
      'card_phone_number': cardPhoneNumber,
      'card_expire': cardExpire,
    });
    print('add plastic card  service');
    print(response.request);
    print(response.body);
    if (response.statusCode == 200) {
      print('*********');
      print('success in  add plastic card  service ');
      print('*********');
      print(response.body);
      Get.snackbar('yourDateSaved'.tr, '',
          colorText: Colors.white, backgroundColor: Color(0xff007E33));
      await PlasticCardType.fetchPlasticCardType(typeId);

      var jsonString =
          EditPlasticCardModel.fromJson(json.decode(response.body));
      return jsonString;
    } else {
      print('error in add  plastic card');
      print(response.reasonPhrase);
    }
  }
}
