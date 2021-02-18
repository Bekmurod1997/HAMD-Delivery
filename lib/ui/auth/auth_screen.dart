import 'dart:ui';

import 'package:HAMD/constants/colors.dart';
import 'package:HAMD/constants/fontSize.dart';
import 'package:HAMD/constants/fonts.dart';
import 'package:HAMD/ui/auth/widgets/form_number.dart';
import 'package:HAMD/ui/auth/widgets/welcome_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/logo_item.dart';

class AuthScreen extends StatelessWidget {
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
                  children: [
                    LogoItem(
                      imageUrl: 'assets/images/logo.png',
                    ),
                    WelcomeText(
                      mainText: 'Добро пожаловать',
                      subText: 'Пожалуйста, авторизуйтесь',
                    ),
                    SizedBox(height: 40),
                    FormNumber(),
                  ],
                ),
                Spacer(),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 12, right: 12, bottom: 30),
                  child: RichText(
                    text: TextSpan(
                        text:
                            'Регистрируясь в нашем приложении Вы полностью соглашаетесь с нашими ',
                        style: FontStyles.regularStyle(
                            fontSize: 10,
                            fontFamily: 'Ubuntu',
                            color: Color(0xffBDBDBD)),
                        children: [
                          TextSpan(
                            text: 'Правилами и Условиями пользования!',
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
        ),
      ),
    );
  }
}
