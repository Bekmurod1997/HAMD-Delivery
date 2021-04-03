import 'package:HAMD/ObxHelper/add_cart_controller.dart';
import 'package:HAMD/constants/colors.dart';
import 'package:HAMD/ui/componants/header.dart';

import 'package:HAMD/ui/payment/widgets/custom_radio_buttons.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final AddCartController addCartController = Get.find<AddCartController>();
  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context).size;
    // var recievedIndex = Get.arguments;

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
                        ],
                      ),
                    ),
                  ),
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
