import 'package:HAMD/constants/fonts.dart';
import 'package:flutter/material.dart';

class ItemDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Ближневосточное блюдо из мяса, обжаренного на вертеле, завёрнутого в лаваш, с добавлением специй, соусов и салата из свежих овощей. Употребляется без использования столовых приборов.',
      maxLines: 5,
      style: FontStyles.regularStyle(
        fontSize: 12,
        fontFamily: 'Poppins',
        color: Color(0xff222E54),
      ),
    );
  }
}
