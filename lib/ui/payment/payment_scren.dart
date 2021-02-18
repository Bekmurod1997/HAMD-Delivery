import 'package:HAMD/constants/colors.dart';
import 'package:HAMD/constants/fontSize.dart';
import 'package:HAMD/constants/fonts.dart';
import 'package:HAMD/ui/auth/sms_screen.dart';
import 'package:HAMD/ui/componants/header.dart';
import 'package:HAMD/ui/pamentStatus/payment_status_screen.dart';
import 'package:HAMD/ui/payment/widgets/address_field.dart';
import 'package:HAMD/ui/payment/widgets/custom_radio_buttons.dart';
import 'package:HAMD/ui/payment/widgets/payment_card.dart';
import 'package:HAMD/ui/payment/widgets/payment_types.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final _formKey = GlobalKey<FormState>();

    String _addressField;
    int recievedIndex = Get.arguments;
    print('recieved index is: $recievedIndex');
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
                    sendIndex: recievedIndex,
                  ),
                  SizedBox(height: 32),
                  //CustomRadioButtons(),
                  SizedBox(height: 32),
                  AddressField(
                    sendIndex: recievedIndex,
                  ),
                  SizedBox(height: 32),
                  // PaymentTypes(),
                  SizedBox(
                    width: screenSize.width * 0.86,
                    height: 63,
                    child: RaisedButton(
                      elevation: 0,
                      color: Color(0xff9F111B),
                      onPressed: () => Get.to(PaymentStatusScreen()),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        'ЗАКАЗАТЬ',
                        style: FontStyles.mediumStyle(
                          fontSize: 20,
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                        ),
                      ),
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
