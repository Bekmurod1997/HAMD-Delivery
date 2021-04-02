import 'package:HAMD/models/payment_type_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PaymentType {
  static var clinet = http.Client();
  static Future fetchPaymentTypes() async {
    var response =
        await clinet.get('http://hamd.loko.uz/api/category?type=payment');
    print(response.request);
    if (response.statusCode == 200) {
      print('success in product category services');
      print(response.body);
      var jsonString = PaymentTypeModel.fromJson(json.decode(response.body));
      return jsonString;
    } else {
      print('error in payment type services');
    }
  }
}
