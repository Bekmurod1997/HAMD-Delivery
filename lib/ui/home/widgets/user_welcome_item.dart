import 'package:HAMD/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserWelcomeItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26),
      child: Container(
        width: double.infinity,
        height: screenSize.height * 0.2,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: 'Добрый день, ',
                          style: FontStyles.regularStyle(
                            fontSize: 22,
                            fontFamily: 'Montserrat',
                            color: Color(0xff222E54),
                          ),
                          children: [
                            TextSpan(
                              text: 'Дмитрий!',
                              style: FontStyles.boldStyle(
                                fontSize: 22,
                                fontFamily: 'Montserrat',
                                color: Color(0xff222E54),
                              ),
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    // Text(
                    //   'Добрый день, Дмитрий!',
                    //   style: FontStyles.regularStyle(
                    //       fontSize: 22,
                    //       fontFamily: 'Montserrat',
                    //       color: Color(0xff222E54)),
                    // ),
                    Text(
                      'Чего желаете сегодня? ',
                      style: FontStyles.regularStyle(
                          fontSize: 18,
                          fontFamily: 'Montserrat',
                          color: Color(0xff222E54)),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      //color: Colors.yellow,
                    ),
                    child: Image.asset('assets/images/user.png')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
