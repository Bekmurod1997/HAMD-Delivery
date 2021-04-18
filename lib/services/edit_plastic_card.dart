import 'dart:convert';
import 'package:HAMD/models/edit_plastic_card_model.dart';
import 'package:HAMD/services/plastic_card_type.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:HAMD/utils/my_prefs.dart';
import 'package:get/get.dart';

class EditPlasticCard {
  static var client = http.Client();
  static Future editPlasticCard(
      {int id,
      int typeId,
      String cardNumber,
      String cardPhoneNumber,
      String cardExpire}) async {
    final token = MyPref.secondToken ?? '';
    var response =
        await client.put('http://hamd.loko.uz/api/card/update', headers: {
      HttpHeaders.authorizationHeader: 'Bearer $token'
    }, body: {
      'id': id.toString(),
      'type_id': typeId.toString(),
      'card_number': cardNumber,
      'card_phone_number': cardPhoneNumber,
      'card_expire': cardExpire,
    });
    print('plastic card edit service');
    print(response.request);
    print(response.body);
    if (response.statusCode == 200) {
      print('*********');
      print('success in  plastic card edit service ');
      print('*********');
      print(response.body);
      Get.snackbar(null, null,
          messageText: Text(
            'Ваши данные сохранены!',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xff007E33));
      await PlasticCardType.fetchPlasticCardType(typeId);

      var jsonString =
          EditPlasticCardModel.fromJson(json.decode(response.body));
      return jsonString;
    } else {
      print('error in all edit plastic card');
      print(response.reasonPhrase);
    }
  }
}
