import 'package:HAMD/constants/fonts.dart';
import 'package:HAMD/ui/cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PriceAndButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Цена',
              style: FontStyles.mediumStyle(
                fontSize: 12,
                fontFamily: 'Poppins',
                color: Color(0xff222E54),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              '27 000 сум',
              style: FontStyles.regularStyle(
                fontSize: 26,
                fontFamily: 'Poppins',
                color: Color(0xff222E54),
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () => Get.to(CartScreen()),
          child: Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              'assets/icons/plus.svg',
              width: 50,
              height: 50,
            ),
          ),
        ),
      ],
    );
  }
}
