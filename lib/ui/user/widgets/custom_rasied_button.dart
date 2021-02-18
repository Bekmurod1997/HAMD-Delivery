import 'package:HAMD/constants/colors.dart';
import 'package:HAMD/constants/fonts.dart';
import 'package:HAMD/ui/user/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomRaisedButton extends StatelessWidget {
  final String buttonText;
  final Function onpres;
  final int selectedIndex;
  final int active;
  CustomRaisedButton(
      {this.buttonText, this.onpres, this.selectedIndex, this.active});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: RaisedButton(
        elevation: 0,
        color: Colors.red.shade200,
        onPressed: onpres,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Text(
          buttonText,
          style: FontStyles.boldStyle(
              fontSize: 15, fontFamily: 'Montserrat', color: Colors.black),
        ),
      ),
    );
  }
}
