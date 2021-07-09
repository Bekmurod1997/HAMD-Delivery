import 'package:HAMD/constants/colors.dart';
import 'package:HAMD/constants/fonts.dart';
import 'package:HAMD/ui/auth/widgets/form_sms.dart';
import 'package:HAMD/ui/auth/widgets/logo_item.dart';
import 'package:HAMD/ui/auth/widgets/sms_text_item.dart';
import 'package:HAMD/utils/my_prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SmsScreen extends StatelessWidget {
  final phoneNumber = MyPref.phoneNumber;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorPalatte.mainPageColor,
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: SizedBox(
              height: height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    children: <Widget>[
                      LogoItem(
                        imageUrl: 'assets/images/logo.png',
                      ),
                      SmsTextItem(
                        myText: 'smsWelcome'.tr +
                            ' +998 *** ** ${phoneNumber.substring(14, 17)}',
                      ),
                      SizedBox(height: 40),
                      FormSms(),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 12, right: 12, bottom: 30),
                    child: RichText(
                      text: TextSpan(
                          text: 'buAuth'.tr,
                          style: FontStyles.regularStyle(
                              fontSize: 10,
                              fontFamily: 'Ubuntu',
                              color: Color(0xffBDBDBD)),
                          children: [
                            TextSpan(
                              text: 'condtionAndRules'.tr,
                              style: FontStyles.regularStyle(
                                  fontSize: 10,
                                  fontFamily: 'Ubuntu',
                                  color: ColorPalatte.strongRedColor),
                            )
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
