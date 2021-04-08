import 'dart:ui';

import 'package:HAMD/ObxHelper/plastic_card_humo_controller.dart';
import 'package:HAMD/ObxHelper/plastic_card_type_controller.dart';
import 'package:HAMD/constants/fonts.dart';
import 'package:HAMD/ui/masks/mask_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

final _formKey = GlobalKey<FormState>();

class PaymentTypes extends StatefulWidget {
  @override
  _PaymentTypesState createState() => _PaymentTypesState();
}

class _PaymentTypesState extends State<PaymentTypes> {
  final PlasticCardTypeController plasticCardTypeController =
      Get.find<PlasticCardTypeController>();
  final PlasticCardHumoController plasticCardHumoController =
      Get.find<PlasticCardHumoController>();
  TextEditingController dateController = TextEditingController();
  TextEditingController dateHumoController = TextEditingController();
  TextEditingController phoneUzController = TextEditingController();
  TextEditingController phoneHumoController = TextEditingController();
  TextEditingController humoController = TextEditingController();
  TextEditingController uzCardController = TextEditingController();
  int selected = 0;
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await plasticCardTypeController.fetchPlasticCardType(14);
    await plasticCardHumoController.fetchPlasticCardHumo(15);
    setState(() {
      if (plasticCardTypeController.plasticCardTypeList.isNotEmpty) {
        print(plasticCardTypeController.plasticCardTypeList.first.cardNumber);
        uzCardController.text =
            plasticCardTypeController.plasticCardTypeList.first.cardNumber;
        dateController.text =
            plasticCardTypeController.plasticCardTypeList.first.cardExpire;
        phoneUzController.text =
            plasticCardTypeController.plasticCardTypeList.first.cardPhoneNumber;
      }
      if (plasticCardHumoController.plasticCardTypeList.isNotEmpty) {
        humoController.text =
            plasticCardHumoController.plasticCardTypeList.first.cardNumber;
        dateHumoController.text =
            plasticCardHumoController.plasticCardTypeList.first.cardExpire;
        phoneHumoController.text =
            plasticCardHumoController.plasticCardTypeList.first.cardPhoneNumber;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TextEditingController uzCardController = TextEditingController();
    // TextEditingController hunoController = TextEditingController();
    // TextEditingController phoneController = TextEditingController();
    // TextEditingController dateController = TextEditingController();
    var payments = [
      'assets/icons/uzcard.svg',
      'assets/images/humo.png',
      'assets/icons/money.svg'
    ];
    var paymentTitle = [
      'UzCard',
      'Humo',
      'Наличка',
    ];

    return Padding(
      padding: EdgeInsets.only(left: 26, right: 26),
      child: Obx(
        () {
          if (plasticCardTypeController.isLoading.value ||
              plasticCardHumoController.isLoading.value) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Метод оплаты',
                    style: FontStyles.mediumStyle(
                      fontSize: 21,
                      fontFamily: 'Montserrat',
                      color: Color(0xff171101),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      width: 13,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = index;
                          print(selected);
                        });
                      },
                      child: Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 100,
                              height: 40,
                              margin: EdgeInsets.only(bottom: 5.0),
                              child: index == 1
                                  ? Image.asset('assets/images/humo.png')
                                  : SvgPicture.asset(
                                      payments[index],
                                    ),
                            ),
                            Text(
                              paymentTitle[index],
                              style: FontStyles.regularStyle(
                                fontSize: 14,
                                fontFamily: 'Montserrat',
                                color: Color(0xff0E0900),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                selected == 2
                    ? Container()
                    : Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Введите номер Вашей карты',
                                style: FontStyles.regularStyle(
                                  fontSize: 11,
                                  fontFamily: 'Montserrat',
                                  color: Color(0xff24253D),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            TextFormField(
                              inputFormatters: selected == 0
                                  ? [InputMask.maskUzCard]
                                  : [InputMask.maskHumo],
                              controller: selected == 0
                                  ? plasticCardTypeController
                                          .plasticCardTypeList.isNotEmpty
                                      ? plasticCardTypeController
                                          .plasticCardTypeList.first.cardNumber
                                      : uzCardController
                                  : plasticCardHumoController
                                          .plasticCardTypeList.isNotEmpty
                                      ? plasticCardHumoController
                                          .plasticCardTypeList.first.cardNumber
                                      : uzCardController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                              style: FontStyles.regularStyle(
                                fontSize: 18,
                                fontFamily: 'Montserrat',
                                color: Color(0xff0E0900),
                              ),
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Номер прикрепленного телефона',
                                      style: FontStyles.regularStyle(
                                        fontSize: 11,
                                        fontFamily: 'Montserrat',
                                        color: Color(0xff24253D),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      'Дата действия',
                                      style: FontStyles.regularStyle(
                                        fontSize: 11,
                                        fontFamily: 'Montserrat',
                                        color: Color(0xff24253D),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 14),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: TextFormField(
                                    inputFormatters: [
                                      InputMask.maskPhoneNumber
                                    ],
                                    controller: uzCardController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                        ),
                                      ),
                                    ),
                                    style: FontStyles.regularStyle(
                                      fontSize: 18,
                                      fontFamily: 'Montserrat',
                                      color: Color(0xff0E0900),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: TextFormField(
                                    inputFormatters: [InputMask.maskDate],
                                    controller: dateController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                        ),
                                      ),
                                    ),
                                    style: FontStyles.regularStyle(
                                      fontSize: 18,
                                      fontFamily: 'Montserrat',
                                      color: Color(0xff0E0900),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                SizedBox(
                  height: 30,
                ),
              ],
            );
          } else {
            return Text('error');
          }
        },
      ),
    );
  }
}
