import 'package:HAMD/constants/colors.dart';
import 'package:HAMD/constants/fontSize.dart';
import 'package:HAMD/constants/fonts.dart';
import 'package:HAMD/ui/home/home_screen.dart';
import 'package:HAMD/ui/user/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../sms_screen.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

final _formKey = GlobalKey<FormState>();

class FormSms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    String _phoneSms;

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                  color: const Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(15)),
              height: 55.0,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.call,
                      color: Colors.grey,
                    ),
                  ),
                  Flexible(
                    child: TextFormField(
                      // autofocus: true,
                      keyboardType: TextInputType.number,

                      //inputFormatters: [FilteringTextInputFormatter.digitsOnly],

                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 15.0),
                        hintText: 'Введите полученный код',
                        hintStyle: FontStyles.regularStyle(
                          fontSize: 12,
                          fontFamily: 'Ubuntu',
                          color: Color(0xff9E9E9E),
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                      onSaved: (input) => _phoneSms = input,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 54,
              width: screenSize.width * 0.8,
              child: RaisedButton(
                elevation: 0,
                color: ColorPalatte.strongRedColor,
                onPressed: () => Get.to(HomeScreen()),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  'Войти в приложение',
                  style: FontStyles.boldStyle(
                      fontSize: 16, fontFamily: 'Ubuntu', color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
