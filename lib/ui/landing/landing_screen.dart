import 'package:HAMD/constants/colors.dart';
import 'package:HAMD/constants/fonts.dart';
import 'package:HAMD/ui/landing/pageview/my_pageview.dart';
import 'package:HAMD/ui/landing/widgets/language_choose.dart';
import 'package:HAMD/utils/my_prefs.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LandingScreen extends StatelessWidget {
  String languageChoice;
  final locales = [
    {'name': 'Uzbek', 'locale': Locale('uz', 'Uz')},
    {'name': 'Russian', 'locale': Locale('ru', 'RU')},
  ];
  updateLocale(Locale locale) {
    Get.updateLocale(locale);
  }

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
              padding: EdgeInsets.only(top: 67),
              child: LanguageChoosing(
                function: () {
                  MyPref.lang = 'ru';
                  updateLocale(locales[1]['locale']);
                  Get.to(MyPageView());
                },
                // function: () => Get.to(AuthScreen()),
                iconName: 'assets/icons/russia.svg',
                text: 'Русский язык',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            LanguageChoosing(
              function: () {
                MyPref.lang = 'uz';
                updateLocale(locales[0]['locale']);
                Get.to(MyPageView());
              },
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
