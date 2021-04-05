import 'dart:io';
import 'package:HAMD/utils/my_prefs.dart';
import 'package:http/http.dart' as http;
import 'package:HAMD/ObxHelper/cart_list_controller.dart';
import 'package:get/get.dart';

final CartListController cartListController = Get.find<CartListController>();

class Order {
  static var client = http.Client();
  static Future makeOrders({String address, int deliveryType}) async {
    final token = MyPref.secondToken ?? '';
    var response =
        await client.post('http://hamd.loko.uz/api/order/send', headers: {
      HttpHeaders.authorizationHeader: 'Bearer $token'
    }, body: {
      'address': address,
      'map_location': '41.329139, 69.242315',
      'comment': 'Хорошего вам дня!',
      'payment_type_id': '10',
      'delivery_type_id': deliveryType.toString(),
    });
    print('ordered all items');
    print(response.request);
    print(response.body);
    if (response.statusCode == 200) {
      print('*********');
      print('success in ordering products');
      print('*********');
      print(response.body);
      cartListController.fetchAllCartList();

      Get.toNamed('/payment-status-screen');
    } else {
      print('error in orderings products services');
      print(response.reasonPhrase);
    }
  }
}
