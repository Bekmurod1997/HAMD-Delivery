import 'package:HAMD/constants/colors.dart';
import 'package:HAMD/constants/fontSize.dart';
import 'package:HAMD/ui/auth/sms_screen.dart';
import 'package:HAMD/ui/cart/widgets/bill.dart';
import 'package:HAMD/ui/cart/widgets/order_button.dart';
import 'package:HAMD/ui/cart/widgets/order_list.dart';
import 'package:HAMD/ui/componants/header.dart';
import 'package:HAMD/ui/payment/payment_scren.dart';
import 'package:HAMD/ui/payment/widgets/custom_radio_buttons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorPalatte.mainPageColor,
      body: Column(
        children: [
          Header(
            icon1Url: 'assets/icons/Icon-left.svg',
            title: 'Корзина',
            onpress1: () => Get.back(),
            icon2Url: 'assets/icons/close.svg',
            onpress2: () => Get.back(),
            height2: 18,
            width2: 18,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) => Column(
                children: [
                  SingleChildScrollView(
                    physics: ScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomRadioButtons(),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 26),
                          //   child: OrderList(),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(height: 16),
                  // Bill(),
                  // SizedBox(height: 16),
                  // OrderButton(),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
