import 'package:HAMD/constants/colors.dart';
import 'package:HAMD/constants/fontSize.dart';
import 'package:HAMD/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';

import '../sms_screen.dart';

final _formKey = GlobalKey<FormState>();

class FormNumber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var controllerNumber =
        MaskedTextController(mask: '000 00 000 00 00', text: '+998');
    String _phoneNumber;

    return Form(
      key: _formKey,
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
                    controller: controllerNumber,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 15.0),
                      hintText: 'Введите свой номер телефона',
                      hintStyle: FontStyles.regularStyle(
                          fontSize: 12,
                          fontFamily: 'Ubuntu',
                          color: Color(0xff9E9E9E)),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                    onSaved: (input) => _phoneNumber = input,
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
              onPressed: () => Get.to(SmsScreen()),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Text(
                'Отправить код',
                style: FontStyles.boldStyle(
                    fontSize: 16, fontFamily: 'Ubuntu', color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
