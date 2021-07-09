import 'package:HAMD/constants/fonts.dart';
import 'package:flutter/material.dart';

class ItemDescription extends StatelessWidget {
  final String foodDes;
  ItemDescription({this.foodDes});
  @override
  Widget build(BuildContext context) {
    return Text(
      foodDes,
      maxLines: 5,
      style: FontStyles.regularStyle(
        fontSize: 12,
        fontFamily: 'Poppins',
        color: Color(0xff222E54),
      ),
    );
  }
}
