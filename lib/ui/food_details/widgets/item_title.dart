import 'package:HAMD/constants/fonts.dart';
import 'package:flutter/material.dart';

class ItemTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Лаваш Средний',
        style: FontStyles.semiBoldStyle(
          fontSize: 24,
          fontFamily: 'Montserrat',
          color: Color(0xff222E54),
        ),
      ),
    );
  }
}
