import 'package:HAMD/constants/colors.dart';
import 'package:HAMD/constants/fontSize.dart';
import 'package:HAMD/constants/fonts.dart';
import 'package:HAMD/ui/componants/header.dart';
import 'package:HAMD/ui/user/widgets/custom_rasied_button.dart';
import 'package:HAMD/ui/user/widgets/my_orders.dart';
import 'package:HAMD/ui/user/widgets/user_data_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  int selectedIndex = 0;
  int selectedCard = 1;
  int active = 0;
  int selectedRadio;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    selectedRadio = 1;
  }

  selectedRadioValue(int val) {
    selectedRadio = val;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalatte.mainPageColor,
      body: Column(
        children: [
          Header(
            icon1Url: 'assets/icons/Icon-left.svg',
            onpress1: () => Get.back(),
            title: 'Мой профиль',
            icon2Url: 'assets/icons/pencil.svg',
            height2: 18,
            width2: 18,
          ),
          Expanded(
            child: ListView(
              children: [
                UserDataItem(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 44,
                          child: RaisedButton(
                            elevation: 0,
                            color: selectedIndex == 0
                                ? Color(0xffE9DCE0)
                                : Colors.transparent,
                            onPressed: () {
                              if (selectedIndex == 1) {
                                setState(() {
                                  selectedIndex = 0;
                                });
                              }
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            child: Text(
                              'Мои заказы',
                              style: FontStyles.boldStyle(
                                  fontSize: 15,
                                  fontFamily: 'Montserrat',
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 44,
                          child: RaisedButton(
                            elevation: 0,
                            color: selectedIndex == 1
                                ? Color(0xffE9DCE0)
                                : Colors.transparent,
                            onPressed: () {
                              if (selectedIndex == 0) {
                                setState(() {
                                  selectedIndex = 1;
                                });
                              }
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            child: Text(
                              'Методы оплат',
                              style: FontStyles.boldStyle(
                                  fontSize: 15,
                                  fontFamily: 'Montserrat',
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                selectedIndex == 0
                    ? Container(
                        padding: EdgeInsets.only(right: 20, left: 20, top: 20),
                        height: 500,
                        child: MyOrders(),
                      )
                    : Container(
                        margin: EdgeInsets.only(top: 50),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: ColorPalatte.strongRedColor,
                              ),
                              child: Center(
                                child: IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    showModalBottomSheet(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                        ),
                                        context: context,
                                        builder: (context) {
                                          return StatefulBuilder(
                                            builder:
                                                (context, StateSetter state) {
                                              return Container(
                                                padding: EdgeInsets.only(
                                                    top: 10,
                                                    left: 20,
                                                    right: 20),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      ' Добавить новую карту',
                                                      style: FontStyles
                                                          .mediumStyle(
                                                        fontSize: 20,
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            Color(0xff0E0E0E),
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/icons/uzcard.svg',
                                                            width: 40,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: RadioListTile(
                                                            activeColor: Color(
                                                                0xffFFBC41),
                                                            controlAffinity:
                                                                ListTileControlAffinity
                                                                    .trailing,
                                                            value: 1,
                                                            groupValue:
                                                                selectedRadio,
                                                            onChanged: (val) {
                                                              print(
                                                                  'Radio $val');
                                                              if (selectedCard ==
                                                                  2) {
                                                                setState(() {
                                                                  selectedCard =
                                                                      1;
                                                                });
                                                                print(
                                                                    'your selecte Card: $selectedCard');
                                                              }
                                                              state(() {
                                                                print(
                                                                    'your selected radio is: $selectedRadio');
                                                                selectedRadioValue(
                                                                    val);
                                                              });
                                                              Get.back();
                                                            },
                                                            title: Text(
                                                              'UzCard',
                                                              style: FontStyles
                                                                  .mediumStyle(
                                                                fontSize: 18,
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xff0E0E0E),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          child: Image.asset(
                                                            'assets/images/humo.png',
                                                            width: 40,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: RadioListTile(
                                                            activeColor: Color(
                                                                0xffFFBC41),
                                                            controlAffinity:
                                                                ListTileControlAffinity
                                                                    .trailing,
                                                            value: 2,
                                                            groupValue:
                                                                selectedRadio,
                                                            onChanged: (val) {
                                                              if (selectedCard ==
                                                                  1) {
                                                                setState(() {
                                                                  selectedCard =
                                                                      2;
                                                                });
                                                                print(
                                                                    'your selecte Card: $selectedCard');
                                                              }
                                                              state(() {
                                                                print(
                                                                    'your selected radio is: $selectedRadio');
                                                                selectedRadioValue(
                                                                    val);
                                                              });
                                                              print(
                                                                  'Radio $val');
                                                              selectedRadioValue(
                                                                  val);
                                                              Get.back();
                                                            },
                                                            title: Text(
                                                              'Humo',
                                                              style: FontStyles
                                                                  .mediumStyle(
                                                                fontSize: 18,
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xff0E0E0E),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        });
                                  },
                                ),
                              ),
                            ),
                            selectedCard == 1
                                ? Image.asset(
                                    'assets/images/card-uzcard.png',
                                    width: 254,
                                  )
                                : Image.asset(
                                    'assets/images/humoCard.png',
                                    width: 254,
                                  )
                          ],
                        ),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
