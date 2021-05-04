import 'package:HAMD/ObxHelper/counterState.dart';
import 'package:HAMD/ObxHelper/orderLoader.dart';
import 'package:HAMD/ObxHelper/plastic_card_universal_controller.dart';
import 'package:HAMD/constants/colors.dart';

import 'package:HAMD/constants/fonts.dart';
import 'package:HAMD/services/order.dart';

import 'package:HAMD/ui/componants/header.dart';

import 'package:HAMD/ui/payment/widgets/address_field.dart';

import 'package:HAMD/ui/payment/widgets/payment_card.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatelessWidget {
  final PlasticCardUniversalController plasticCardUniversalController =
      Get.find<PlasticCardUniversalController>();
  final OrderLoaderController orderLoaderController =
      Get.find<OrderLoaderController>();
  @override
  Widget build(BuildContext context) {
    var recievedIndex = Get.arguments;
    var recieve = ModalRoute.of(context).settings.arguments;
    final screenSize = MediaQuery.of(context).size;

    print('recieved index is: $recievedIndex');
    print('recived lat and ling');
    print(recievedIndex[2]);
    return Scaffold(
      backgroundColor: ColorPalatte.mainPageColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(
            icon1Url: 'assets/icons/Icon-left.svg',
            title: 'Статус заказа',
            icon2Url: 'assets/icons/close.svg',
            onpress1: () => Get.back(),
            onpress2: () => Get.back(),
            height2: 18,
            width2: 18,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) => Column(
                children: [
                  PaymentCard(
                    sendIndex: recievedIndex[0],
                  ),
                  SizedBox(height: 32),
                  //CustomRadioButtons(),
                  SizedBox(height: 32),
                  AddressField(
                    sendIndex: recievedIndex[0],
                  ),
                  SizedBox(height: 32),
                  // PaymentTypes(),
                  SizedBox(
                    width: screenSize.width * 0.86,
                    height: 63,
                    child: Obx(
                      () {
                        return RaisedButton(
                          elevation: 0,
                          color: Color(0xff9F111B),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: orderLoaderController.loading.value
                              ? CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                )
                              : Text(
                                  'ЗАКАЗАТЬ',
                                  style: FontStyles.mediumStyle(
                                    fontSize: 20,
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                  ),
                                ),
                          onPressed: () async {
                            var delivery = 12;
                            if (recievedIndex[0] == 2) {
                              delivery = 13;
                            }
                            print('this is $delivery');
                            await orderLoaderController.onFetching();

                            Order.makeOrders(
                                address: recievedIndex[1],
                                deliveryType: delivery,
                                location: recievedIndex[2]);
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
