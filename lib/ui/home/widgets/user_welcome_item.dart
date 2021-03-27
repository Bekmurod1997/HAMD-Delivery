import 'package:HAMD/ObxHelper/profile_controller.dart';
import 'package:HAMD/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserWelcomeItem extends StatelessWidget {
  final UserProfileController ppController = Get.find<UserProfileController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
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
                              text: ppController.profileList.first.name ?? '',
                              style: FontStyles.boldStyle(
                                fontSize: 22,
                                fontFamily: 'Montserrat',
                                color: Color(0xff222E54),
                              ),
                            )
                          ]),
                    ),

                    // print(ppController.profileList);

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
                child: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(
                      'http://hamd.loko.uz/' +
                          ppController?.profileList?.first?.photo,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
