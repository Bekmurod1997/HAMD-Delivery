import 'package:HAMD/ObxHelper/cart_list_controller.dart';
import 'package:HAMD/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bill extends StatefulWidget {
  final int sendIndex;
  Bill({this.sendIndex});

  @override
  _BillState createState() => _BillState();
}

class _BillState extends State<Bill> {
  final CartListController cartListController = Get.find<CartListController>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width * 0.86,
      height: widget.sendIndex == 2 ? 110 : 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Obx(() {
          int sum = 0;
          int finalPrice;

          for (var i = 0; i < cartListController.allCartList.length; i++) {
            sum += cartListController.allCartList[i].totalPrice;
          }
          if (widget.sendIndex == 1) {
            finalPrice = sum + 10000;
          }

          return Column(
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
                    sum.toString(),
                    style: FontStyles.mediumStyle(
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      color: Color(0xff494D6D),
                    ),
                  ),
                ],
              ),
              widget.sendIndex == 2
                  ? Container()
                  : SizedBox(
                      height: 13,
                    ),
              widget.sendIndex == 2
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
                  widget.sendIndex == 2
                      ? Text(
                          sum.toString(),
                          style: FontStyles.semiBoldStyle(
                            fontSize: 18,
                            fontFamily: 'Montserrat',
                            color: Color(0xff9F111B),
                          ),
                        )
                      : Text(
                          finalPrice.toString(),
                          style: FontStyles.semiBoldStyle(
                            fontSize: 18,
                            fontFamily: 'Montserrat',
                            color: Color(0xff9F111B),
                          ),
                        )
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}

// int sum = 0;

//                 for (var i = 0;
//                     i < cartListController.allCartList.length;
//                     i++) {
//                   sum += cartListController.allCartList[i].totalPrice;
//                 }
