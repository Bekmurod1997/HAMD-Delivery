import 'package:HAMD/constants/fonts.dart';
import 'package:flutter/material.dart';

class Bill extends StatelessWidget {
  final int sendIndex;
  Bill({this.sendIndex});
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width * 0.86,
      height: sendIndex == 1 ? 110 : 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 29,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Стоимость блюд',
                  style: FontStyles.mediumStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    color: Color(0xff494D6D),
                  ),
                ),
                Text(
                  '124 000',
                  style: FontStyles.mediumStyle(
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    color: Color(0xff494D6D),
                  ),
                ),
              ],
            ),
            sendIndex == 1
                ? Container()
                : SizedBox(
                    height: 13,
                  ),
            sendIndex == 1
                ? Container()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Доставка',
                        style: FontStyles.mediumStyle(
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          color: Color(0xff494D6D),
                        ),
                      ),
                      Text(
                        '10 000',
                        style: FontStyles.mediumStyle(
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          color: Color(0xff494D6D),
                        ),
                      ),
                    ],
                  ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Итого',
                  style: FontStyles.semiBoldStyle(
                    fontSize: 18,
                    fontFamily: 'Montserrat',
                    color: Color(0xff9F111B),
                  ),
                ),
                Text(
                  '134 00',
                  style: FontStyles.semiBoldStyle(
                    fontSize: 18,
                    fontFamily: 'Montserrat',
                    color: Color(0xff9F111B),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
