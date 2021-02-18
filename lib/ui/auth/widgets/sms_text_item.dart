import 'package:HAMD/constants/fonts.dart';
import 'package:flutter/material.dart';

class SmsTextItem extends StatelessWidget {
  final String myText;
  SmsTextItem({this.myText});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10, left: 30, top: 67),
      child: Text(
        myText,
        style: FontStyles.regularStyle(
            fontSize: 14, fontFamily: 'Ubuntu', color: Colors.black),
      ),
    );
  }
}
