import 'dart:convert';
import 'dart:io';
import 'package:HAMD/ObxHelper/item_category_controller.dart';
import 'package:HAMD/ObxHelper/product_by_category.dart';
import 'package:HAMD/ObxHelper/profile_controller.dart';
import 'package:HAMD/models/code_confirm_model.dart';
import 'package:HAMD/utils/my_prefs.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:HAMD/constants/api.dart';

class ConfirmCode {
  static UserProfileController pController = Get.find<UserProfileController>();
  static CategoryItemController categoryData =
      Get.find<CategoryItemController>();
  static ProductByCategoryController productByCategoryController =
      Get.find<ProductByCategoryController>();
  static var client = http.Client();
  static Future codeConfirmFunction({String code, String fcmToken}) async {
    final token = MyPref.token ?? '';
    var response = await client.post(
      ApiUrl.sendSmsCode,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      body: {
        'code': code,
      },
    );
    print('condirm code part');
    print(response.request);
    if (response.statusCode == 200) {
      var body = CodeConfirmModel.fromJson(json.decode(response.body));
      print('confrim token');
      print(response.body);
      MyPref.secondToken = body.data.token;
      print('token after confirm');
      print(MyPref.secondToken);
      pController.fetchProfileData();
      categoryData.fetchCategories();
      productByCategoryController.fetchProductByCategory(28);
      return body;
    } else {
      print(response.reasonPhrase);
    }
  }
}
