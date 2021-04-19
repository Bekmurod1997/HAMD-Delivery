import 'package:HAMD/constants/api.dart';
import 'package:HAMD/models/sign_in_model.dart';
import 'package:HAMD/ui/auth/sms_screen.dart';
import 'package:HAMD/utils/my_prefs.dart';

import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SignIn {
  static var client = http.Client();
  static Future signInUser({String userNumber, String fcmToken}) async {
    try {
      var response = await client.post(ApiUrl.signIn, body: {
        'phone': userNumber,
        'role': '3',
        'device_token': fcmToken,
      });
      if (response.statusCode == 200) {
        var body = SignInModel.fromJson(json.decode(response.body));
        print(response.body);
        print('bu yerda token');
        print(body.data.token);

        print('bu yerda code');
        print(body.data.code.code);
        MyPref.token = body.data.token;
        MyPref.code = body.data.code.code;

        print('saved token');
        print(MyPref.token);
        Get.back();
        Get.to(SmsScreen());
      }
      return;
    } catch (e) {
      return Get.snackbar('error', e);
    }
  }
}
