import 'package:HAMD/constants/colors.dart';
import 'package:HAMD/constants/fonts.dart';
import 'package:HAMD/ui/cart/widgets/bill.dart';
import 'package:HAMD/ui/cart/widgets/order_button.dart';
import 'package:HAMD/ui/cart/widgets/order_list.dart';
import 'package:flutter/material.dart';

class CustomRadioButtons extends StatefulWidget {
  @override
  _CustomRadioButtonsState createState() => _CustomRadioButtonsState();
}

enum CustomRadioString { hamd, delivery }

class _CustomRadioButtonsState extends State<CustomRadioButtons> {
  final _formKey = GlobalKey<FormState>();
  CustomRadioString _site = CustomRadioString.delivery;
  int selectedRadio;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedRadio = 2;
  }

  selectedRadioValue(int val) {
    selectedRadio = val;
  }

  @override
  Widget build(BuildContext context) {
    String _addressField;

    return Theme(
      data: Theme.of(context).copyWith(
          unselectedWidgetColor: ColorPalatte.strongRedColor,
          disabledColor: ColorPalatte.strongRedColor),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RadioListTile(
              dense: true,
              activeColor: Color(0xff9F111B),
              value: 1,
              groupValue: selectedRadio,
              onChanged: (val) {
                setState(() {
                  selectedRadioValue(val);
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(
                'Самовывоз из HAMD',
                style: FontStyles.semiBoldStyle(
                  fontSize: 21,
                  fontFamily: 'Montserrat',
                  color: Color(0xff171101),
                ),
              ),
            ),

            RadioListTile(
              dense: true,
              activeColor: Color(0xff9F111B),
              value: 2,
              groupValue: selectedRadio,
              onChanged: (val) {
                setState(() {
                  selectedRadioValue(val);
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(
                'Доставка',
                style: FontStyles.semiBoldStyle(
                  fontSize: 21,
                  fontFamily: 'Montserrat',
                  color: Color(0xff171101),
                ),
              ),
            ),

            // ListTile(
            //   title: Text(
            //     'Самовывоз из HAMD',
            //     style: FontStyles.semiBoldStyle(
            //       fontSize: 21,
            //       fontFamily: 'Montserrat',
            //       color: Color(0xff171101),
            //     ),
            //   ),
            //   leading: Radio(
            //       activeColor: ColorPalatte.strongRedColor,
            //       value: CustomRadioString.hamd,
            //       groupValue: _site,
            //       onChanged: (CustomRadioString value) {
            //         setState(() {
            //           _site = value;
            //         });
            //       }),
            // ),
            // ListTile(
            //   title: Text(
            //     'Доставка',
            //     style: FontStyles.semiBoldStyle(
            //       fontSize: 21,
            //       fontFamily: 'Montserrat',
            //       color: Color(0xff171101),
            //     ),
            //   ),
            //   leading: Radio(
            //       activeColor: ColorPalatte.strongRedColor,
            //       value: CustomRadioString.delivery,
            //       groupValue: _site,
            //       onChanged: (CustomRadioString value) {
            //         setState(() {
            //           _site = value;
            //         });
            //       }),
            // ),

            selectedRadio == 2
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    child: Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Text(
                        'Адрес доставки',
                        style: FontStyles.mediumStyle(
                          fontSize: 21,
                          fontFamily: 'Montserrat',
                          color: Color(0xff171101),
                        ),
                      ),
                    ),
                  )
                : Container(),
            // SizedBox(
            //   height: 23,
            // ),
            selectedRadio == 2
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20, top: 30),
                      child: Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.location_on,
                                  color: Colors.grey,
                                ),
                                hintText: 'ул. Умарова, д.18',
                                hintStyle: FontStyles.regularStyle(
                                  fontSize: 14,
                                  fontFamily: 'Montserrat',
                                  color: Color(0xff0E0900),
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
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                              onSaved: (input) => _addressField = input,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),

            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: OrderList(),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Bill(
                sendIndex: selectedRadio,
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: OrderButton(
                sendIndex: selectedRadio,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
