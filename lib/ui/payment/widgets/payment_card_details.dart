import 'package:HAMD/constants/fonts.dart';
import 'package:flutter/material.dart';

class PaymentCardDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Введите номер Вашей карты',
          style: FontStyles.regularStyle(
            fontSize: 11,
            fontFamily: 'Montserrat',
            color: Color(0xff24253D),
          ),
        )
      ],
    );
  }
}
