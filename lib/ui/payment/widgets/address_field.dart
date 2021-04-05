import 'package:HAMD/constants/fonts.dart';
import 'package:HAMD/ui/masks/mask_format.dart';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class AddressField extends StatefulWidget {
  //changed to final
  final int sendIndex;
  AddressField({this.sendIndex});
  @override
  _AddressFieldState createState() => _AddressFieldState();
}

class _AddressFieldState extends State<AddressField> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController uzCardController = TextEditingController();
  TextEditingController humoController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  int selected = 0;

  @override
  Widget build(BuildContext context) {
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
      padding: const EdgeInsets.only(left: 24, right: 28),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   'Адрес доставки',
            //   style: FontStyles.mediumStyle(
            //     fontSize: 21,
            //     fontFamily: 'Montserrat',
            //     color: Color(0xff171101),
            //   ),
            // ),
            // SizedBox(
            //   height: 13,
            // ),
            // Container(
            //   child: Row(
            //     children: [
            //       Flexible(
            //         child: TextFormField(
            //           decoration: InputDecoration(
            //             suffixIcon: Icon(
            //               Icons.location_on,
            //               color: Colors.grey,
            //             ),
            //             hintText: 'ул. Умарова, д.18',
            //             hintStyle: FontStyles.regularStyle(
            //               fontSize: 14,
            //               fontFamily: 'Montserrat',
            //               color: Color(0xff0E0900),
            //             ),
            //             filled: true,
            //             fillColor: Colors.white,
            //             focusedBorder: OutlineInputBorder(
            //               borderRadius: BorderRadius.circular(15.0),
            //               borderSide: BorderSide(
            //                 color: Colors.white,
            //               ),
            //             ),
            //             enabledBorder: OutlineInputBorder(
            //               borderRadius: BorderRadius.circular(15.0),
            //               borderSide: BorderSide(
            //                 color: Colors.transparent,
            //               ),
            //             ),
            //           ),
            //           style: TextStyle(
            //             color: Colors.black,
            //             fontSize: 16.0,
            //           ),
            //           onSaved: (input) => _addressField = input,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(height: 20),
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
                        Stack(
                          overflow: Overflow.visible,
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
                            selected == index
                                ? Positioned(
                                    right: 0,
                                    top: -25,
                                    child: SvgPicture.asset(
                                        'assets/icons/check.svg'),
                                  )
                                : Container(),
                          ],
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
                : Column(
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
                        controller:
                            selected == 0 ? uzCardController : humoController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: selected == 0 ? '8600' : '9860',
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
                            flex: 3,
                            child: TextFormField(
                              inputFormatters: [InputMask.maskPhoneNumber],
                              controller: phoneController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: '998',
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
                                hintText: '00/00',
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
                          ),
                        ],
                      )
                    ],
                  ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
