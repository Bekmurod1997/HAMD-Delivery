import 'package:HAMD/constants/colors.dart';
import 'package:HAMD/constants/fonts.dart';
import 'package:HAMD/ui/landing/pageview/my_pageview.dart';
import 'package:HAMD/ui/landing/widgets/language_choose.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorPalatte.mainPageColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: screenSize.height * 0.15,
                  right: screenSize.width * 0.14,
                  left: screenSize.width * 0.14),
              child: Image.asset('assets/images/logo.png'),
            ),
            Padding(
              padding: EdgeInsets.only(right: 37, left: 37, top: 67),
              child: Text(
                  'На каком языке Вы предпо  читаете пользоваться нашим приложением?',
                  style: FontStyles.regularStyle(
                      fontSize: 14, fontFamily: 'Ubuntu')),
            ),
            Padding(
              padding: EdgeInsets.only(top: 67),
              child: LanguageChoosing(
                function: () => Get.to(MyPageView()),
                // function: () => Get.to(AuthScreen()),
                iconName: 'assets/icons/russia.svg',
                text: 'Русский язык',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            LanguageChoosing(
              function: () => Get.to(MyPageView()),
              // function: () => Get.to(AuthScreen()),

              iconName: 'assets/icons/uzbekistan.svg',
              text: 'O\'zbek tili',
            ),
          ],
        ),
      ),
    );
  }
}
