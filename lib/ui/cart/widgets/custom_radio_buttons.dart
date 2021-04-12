import 'package:HAMD/ObxHelper/delivert_type_controller.dart';
import 'package:HAMD/constants/colors.dart';
import 'package:HAMD/constants/fontSize.dart';
import 'package:HAMD/constants/fonts.dart';
import 'package:HAMD/ui/cart/widgets/bill.dart';
import 'package:HAMD/ui/cart/widgets/google_map_creen.dart';
import 'package:HAMD/ui/cart/widgets/order_button.dart';
import 'package:HAMD/ui/cart/widgets/order_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class CustomRadioButtons extends StatefulWidget {
  @override
  _CustomRadioButtonsState createState() => _CustomRadioButtonsState();
}

enum CustomRadioString { hamd, delivery }

class _CustomRadioButtonsState extends State<CustomRadioButtons> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController addressController = TextEditingController();
  // final _formKey = GlobalKey<FormState>();
  // CustomRadioString _site = CustomRadioString.delivery;
  int selectedRadio;
  final DelivertyTypeController delivertyTypeController =
      Get.find<DelivertyTypeController>();
  @override
  void initState() {
    super.initState();
    selectedRadio = 2;
  }

  selectedRadioValue(int val) {
    selectedRadio = val;
  }

  //google map
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          unselectedWidgetColor: ColorPalatte.strongRedColor,
          disabledColor: ColorPalatte.strongRedColor),
      child: Obx(
        () {
          if (delivertyTypeController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Form(
              key: _formKey,
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
                      // 'Самовывоз из HAMD',
                      delivertyTypeController.deliveryTypeList[0].name,
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
                      // 'Доставка',
                      delivertyTypeController.deliveryTypeList[1].name,
                      style: FontStyles.semiBoldStyle(
                        fontSize: 21,
                        fontFamily: 'Montserrat',
                        color: Color(0xff171101),
                      ),
                    ),
                  ),

                  selectedRadio == 1
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
                  selectedRadio == 1
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 26),
                          child: Container(
                            margin: EdgeInsets.only(bottom: 20, top: 30),
                            child: Row(
                              children: [
                                Flexible(
                                  child: TextFormField(
                                    controller: addressController,
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          Icons.location_on,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () {
                                          // Get.to(MapSample());
                                          return showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  content: Container(
                                                    height: 440,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .75,
                                                    // child: Text('map'),
                                                    child: GoogleMap(
                                                      onMapCreated:
                                                          _onMapCreated,
                                                      initialCameraPosition:
                                                          CameraPosition(
                                                        target: _center,
                                                        zoom: 11.0,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              });
                                        },
                                      ),
                                      // Icon(
                                      //   Icons.location_on,
                                      //   color: Colors.grey,
                                      // ),
                                      hintText: 'ул. Умарова, д.18',
                                      hintStyle: FontStyles.regularStyle(
                                        fontSize: 14,
                                        fontFamily: 'Montserrat',
                                        color: Color(0xff0E0900),
                                      ),
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
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                    ),
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
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.86,
                        height: 63,
                        child: RaisedButton(
                          elevation: 0,
                          color: Color(0xff9F111B),
                          onPressed: () =>
                              Get.toNamed('/payment-screen', arguments: [
                            selectedRadio,
                            selectedRadio == 1
                                ? addressController.text
                                : 'Самовывоз из HAMD',
                          ]),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            'ЗАКАЗАТЬ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: FontPalatte.nextButtonSize),
                          ),
                        ),
                      )
                      // OrderButton(
                      //   selectedRadio == 1
                      //       ? addressController.text
                      //       : 'Самовывоз из HAMD',
                      //   sendIndex: selectedRadio,
                      // ),
                      ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
