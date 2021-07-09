import 'package:HAMD/ObxHelper/list_of_orders.dart';
import 'package:HAMD/ObxHelper/order_detail_view_controller.dart';
import 'package:HAMD/ObxHelper/plastic_card_humo_controller.dart';
import 'package:HAMD/ObxHelper/plastic_card_type_controller.dart';
import 'package:HAMD/ObxHelper/platic_card_controller.dart';
import 'package:HAMD/constants/colors.dart';

import 'package:HAMD/constants/fonts.dart';
import 'package:HAMD/services/add_card_type.dart';
import 'package:HAMD/services/edit_plastic_card.dart';
import 'package:HAMD/services/plastic_card_type.dart';
import 'package:HAMD/ui/componants/header.dart';

import 'package:HAMD/ui/user/widgets/my_orders.dart';
import 'package:HAMD/ui/user/widgets/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:HAMD/ui/masks/mask_format.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final OrderDetailViewController orderDetailViewController =
      Get.find<OrderDetailViewController>();
  final PlaticCardController platicCardController =
      Get.find<PlaticCardController>();
  final PlasticCardTypeController plasticCardTypeController =
      Get.find<PlasticCardTypeController>();
  final PlasticCardHumoController plasticCardHumoController =
      Get.find<PlasticCardHumoController>();
  final ListOfAllOrdersControllers listOfAllOrdersControllers =
      Get.find<ListOfAllOrdersControllers>();
  TextEditingController dateController = TextEditingController();
  TextEditingController dateHumoController = TextEditingController();
  TextEditingController phoneUzController = TextEditingController();
  TextEditingController phoneHumoController = TextEditingController();
  TextEditingController humoController = TextEditingController(text: '9860');
  TextEditingController uzCardController = TextEditingController(text: '8600');
  int selectedIndex = 0;
  int active = 0;

  bool autFocus;
  FocusNode cardNumber;
  FocusNode cardPhoneNumber;
  FocusNode expireDate;

  @override
  void initState() {
    super.initState();
    listOfAllOrdersControllers.fetchListOfOrders();
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
            title: 'profileTitle'.tr,
            icon2Url: 'assets/icons/pencil.svg',
            onpress2: () => Get.toNamed('/edit-profile-screen'),
            height2: 18,
            width2: 18,
          ),
          Expanded(
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView(
                children: [
                  UserInfo(),
                  // UserDataItem(),
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
                                'myOrders'.tr,
                                // listOfAllOrdersControllers.orderList.length
                                //     .toString(),
                                style: FontStyles.boldStyle(
                                    fontSize: 14,
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
                              onPressed: () async {
                                if (selectedIndex == 0) {
                                  setState(() {
                                    selectedIndex = 1;
                                  });
                                }
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              child: Text(
                                'paymentMethod'.tr,
                                style: FontStyles.boldStyle(
                                    fontSize: 14,
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
                          padding:
                              EdgeInsets.only(right: 20, left: 20, top: 20),
                          height: 500,
                          child: MyOrders(),
                        )
                      : Container(
                          margin: EdgeInsets.only(top: 50),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: UserPaymentType(),
                        ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class UserPaymentType extends StatefulWidget {
  @override
  _UserPaymentTypeState createState() => _UserPaymentTypeState();
}

class _UserPaymentTypeState extends State<UserPaymentType> {
  int selectedRadio = 1;
  int selectedCard = 1;
  bool loading = false;
  final PlaticCardController platicCardController =
      Get.find<PlaticCardController>();
  final PlasticCardTypeController plasticCardTypeController =
      Get.find<PlasticCardTypeController>();
  final PlasticCardHumoController plasticCardHumoController =
      Get.find<PlasticCardHumoController>();
  final ListOfAllOrdersControllers listOfAllOrdersControllers =
      Get.find<ListOfAllOrdersControllers>();
  TextEditingController dateController = TextEditingController();
  TextEditingController dateHumoController = TextEditingController();
  TextEditingController phoneUzController = TextEditingController();
  TextEditingController phoneHumoController = TextEditingController();
  TextEditingController humoController = TextEditingController();
  TextEditingController uzCardController = TextEditingController();

  selectedRadioValue(int val) {
    selectedRadio = val;
  }

  @override
  void didChangeDependencies() {
    callPlasticCard();
    super.didChangeDependencies();
  }

  callPlasticCard() async {
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
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
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
                            builder: (context, StateSetter state) {
                              return Container(
                                padding: EdgeInsets.only(
                                    top: 10, left: 20, right: 20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'addNewCard'.tr,
                                      style: FontStyles.mediumStyle(
                                        fontSize: 20,
                                        fontFamily: 'Montserrat',
                                        color: Color(0xff0E0E0E),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: SvgPicture.asset(
                                            'assets/icons/uzcard.svg',
                                            width: 40,
                                          ),
                                        ),
                                        Expanded(
                                          child: RadioListTile(
                                            activeColor: Color(0xffFFBC41),
                                            controlAffinity:
                                                ListTileControlAffinity
                                                    .trailing,
                                            value: 1,
                                            groupValue: selectedRadio,
                                            onChanged: (val) async {
                                              print('Radio $val');

                                              print(
                                                  'changing zapros to plastic card');
                                              await PlasticCardType
                                                  .fetchPlasticCardType(14);

                                              if (plasticCardTypeController
                                                  .plasticCardTypeList
                                                  .isNotEmpty) {
                                                setState(() {
                                                  uzCardController.text =
                                                      plasticCardTypeController
                                                          .plasticCardTypeList
                                                          .first
                                                          .cardNumber;
                                                  dateController.text =
                                                      plasticCardTypeController
                                                          .plasticCardTypeList
                                                          .first
                                                          .cardExpire;
                                                  phoneUzController.text =
                                                      plasticCardTypeController
                                                          .plasticCardTypeList
                                                          .first
                                                          .cardPhoneNumber;
                                                });
                                              }
                                              if (selectedCard == 2) {
                                                setState(() {
                                                  selectedCard = 1;
                                                });
                                                print(
                                                    'your selecte Card: ${selectedCard}');
                                              }
                                              state(() {
                                                print(
                                                    'your selected radio is: ${selectedRadio}');
                                                selectedRadioValue(val);
                                              });
                                              Get.back();
                                            },
                                            title: Text(
                                              'UzCard',
                                              style: FontStyles.mediumStyle(
                                                fontSize: 18,
                                                fontFamily: 'Montserrat',
                                                color: Color(0xff0E0E0E),
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
                                            activeColor: Color(0xffFFBC41),
                                            controlAffinity:
                                                ListTileControlAffinity
                                                    .trailing,
                                            value: 2,
                                            groupValue: selectedRadio,
                                            onChanged: (val) async {
                                              print(
                                                  'changing zapros to plastic card');
                                              await PlasticCardType
                                                  .fetchPlasticCardType(15);

                                              if (plasticCardHumoController
                                                  .plasticCardTypeList
                                                  .isNotEmpty) {
                                                setState(() {
                                                  humoController.text =
                                                      plasticCardHumoController
                                                          .plasticCardTypeList
                                                          .first
                                                          .cardNumber;
                                                  dateHumoController.text =
                                                      plasticCardHumoController
                                                          .plasticCardTypeList
                                                          .first
                                                          .cardExpire;
                                                  phoneHumoController.text =
                                                      plasticCardHumoController
                                                          .plasticCardTypeList
                                                          .first
                                                          .cardPhoneNumber;
                                                });
                                              }
                                              if (selectedCard == 1) {
                                                setState(() {
                                                  selectedCard = 2;
                                                });
                                                print(
                                                    'your selecte Card: ${selectedCard}');
                                              }
                                              state(() {
                                                print(
                                                    'your selected radio is: ${selectedRadio}');
                                                selectedRadioValue(val);
                                              });
                                              print('Radio $val');
                                              selectedRadioValue(val);
                                              Get.back();
                                            },
                                            title: Text(
                                              'Humo',
                                              style: FontStyles.mediumStyle(
                                                fontSize: 18,
                                                fontFamily: 'Montserrat',
                                                color: Color(0xff0E0E0E),
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
        Obx(() {
          if (plasticCardTypeController.isLoading.value ||
              plasticCardHumoController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 25),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'writeCardNumber'.tr,
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
                    controller:
                        selectedCard == 1 ? uzCardController : humoController,
                    inputFormatters: selectedRadio == 1
                        ? [InputMask.maskUzCard]
                        : [InputMask.maskHumo],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: selectedRadio == 1 ? '8600' : '9860',
                      hintStyle: FontStyles.regularStyle(
                        fontSize: 16,
                        fontFamily: 'Ubuntu',
                        color: Color(0xff9E9E9E),
                      ),
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
                            'enteredNumber'.tr,
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
                            'exprireDate'.tr,
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
                        flex: 3,
                        child: TextFormField(
                          inputFormatters: [InputMask.maskPhoneNumber],
                          controller: selectedRadio == 1
                              ? phoneUzController
                              : phoneHumoController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: '+998',
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
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          controller: selectedRadio == 1
                              ? dateController
                              : dateHumoController,
                          inputFormatters: [InputMask.maskDate],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: '.. / ..',
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
                      ),
                    ],
                  ),
                  loading
                      ? CircularProgressIndicator()
                      : selectedCard == 1
                          ? Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: SizedBox(
                                height: 63,
                                width: 250,
                                child: RaisedButton(
                                    elevation: 0,
                                    color: Color(0xff9F111B),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: plasticCardTypeController
                                            .plasticCardTypeList.isNotEmpty
                                        ? Text(
                                            'change'.tr,
                                            style: FontStyles.mediumStyle(
                                              fontSize: 20,
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                            ),
                                          )
                                        : Text(
                                            'enter'.tr,
                                            style: FontStyles.mediumStyle(
                                              fontSize: 20,
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                            ),
                                          ),
                                    onPressed: () {
                                      setState(() {
                                        loading = true;
                                      });
                                      plasticCardTypeController
                                              .plasticCardTypeList.isNotEmpty
                                          ? EditPlasticCard.editPlasticCard(
                                              id: plasticCardTypeController
                                                  .plasticCardTypeList.first.id,
                                              typeId: plasticCardTypeController
                                                  .plasticCardTypeList
                                                  .first
                                                  .paymentType
                                                  .id,
                                              cardNumber: uzCardController.text,
                                              cardPhoneNumber:
                                                  phoneUzController.text,
                                              cardExpire: dateController.text,
                                            ).then((value) {
                                              setState(() {
                                                loading = false;
                                              });
                                            })
                                          : AddPlasticCardType
                                                  .addPlasticCardType(
                                                      typeId: 14,
                                                      cardNumber:
                                                          uzCardController.text,
                                                      cardPhoneNumber:
                                                          phoneUzController
                                                              .text,
                                                      cardExpire:
                                                          dateController.text)
                                              .then((value) {
                                              setState(() {
                                                loading = false;
                                              });
                                            });
                                    }),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: SizedBox(
                                height: 63,
                                width: 250,
                                child: RaisedButton(
                                  elevation: 0,
                                  color: Color(0xff9F111B),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: plasticCardHumoController
                                          .plasticCardTypeList.isNotEmpty
                                      ? Text('change'.tr,
                                          style: FontStyles.mediumStyle(
                                            fontSize: 20,
                                            fontFamily: 'Montserrat',
                                            color: Colors.white,
                                          ))
                                      : Text('enter'.tr,
                                          style: FontStyles.mediumStyle(
                                            fontSize: 20,
                                            fontFamily: 'Montserrat',
                                            color: Colors.white,
                                          )),
                                  onPressed: () {
                                    setState(() {
                                      loading = true;
                                    });

                                    plasticCardHumoController
                                            .plasticCardTypeList.isNotEmpty
                                        ? EditPlasticCard.editPlasticCard(
                                            id: plasticCardHumoController
                                                .plasticCardTypeList.first.id,
                                            typeId: plasticCardHumoController
                                                .plasticCardTypeList
                                                .first
                                                .paymentType
                                                .id,
                                            cardNumber: humoController.text,
                                            cardPhoneNumber:
                                                phoneHumoController.text,
                                            cardExpire: dateHumoController.text,
                                          ).then(
                                            (value) => setState(() {
                                              loading = false;
                                            }),
                                          )
                                        : AddPlasticCardType.addPlasticCardType(
                                                typeId: 15,
                                                cardNumber: humoController.text,
                                                cardPhoneNumber:
                                                    humoController.text,
                                                cardExpire:
                                                    dateHumoController.text)
                                            .then(
                                            (value) => setState(() {
                                              loading = false;
                                            }),
                                          );
                                  },
                                ),
                              ),
                            )
                ],
              ),
            );
          }
        }),
      ],
    );
  }
}
