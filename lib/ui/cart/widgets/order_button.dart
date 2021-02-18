import 'package:HAMD/constants/fontSize.dart';
import 'package:HAMD/ui/payment/payment_scren.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderButton extends StatelessWidget {
  final int sendIndex;
  OrderButton({this.sendIndex});
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width * 0.86,
      height: 63,
      child: RaisedButton(
        elevation: 0,
        color: Color(0xff9F111B),
        onPressed: () => Get.to(PaymentScreen(), arguments: sendIndex),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Text(
          'ЗАКАЗАТЬ',
          style: TextStyle(
              color: Colors.white, fontSize: FontPalatte.nextButtonSize),
        ),
      ),
    );
  }
}
