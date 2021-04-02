import 'package:HAMD/ObxHelper/counterState.dart';
import 'package:HAMD/utils/my_prefs.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

final CounterClass counterState = Get.find<CounterClass>();

class AddCartPostService {
  static var client = http.Client();
  static Future addCartPostService({int productId, int amount}) async {
    final token = MyPref.secondToken ?? '';
    print(token);
    var response =
        await client.post('http://hamd.loko.uz/api/cart/send', headers: {
      HttpHeaders.authorizationHeader: 'Bearer $token'
    }, body: {
      'product_id': productId.toString(),
      'amount': amount.toString(),
    });
    print(response.request);
    print(counterState.loading.value);
    if (response.statusCode == 200) {
      print('success added to cart');
      print(counterState.loading.value);
      counterState.onSuccess();
    } else {
      counterState.onSuccess();
      print(counterState.loading.value);
      print(response.reasonPhrase);
    }
  }
}
