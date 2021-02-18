import 'package:HAMD/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentCard extends StatelessWidget {
  final int sendIndex;
  PaymentCard({this.sendIndex});
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        height:
            sendIndex == 1 ? screenSize.height * .20 : screenSize.height * 0.23,
        width: screenSize.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 12, right: 15),
          child: Column(
            children: [
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Детали заказа',
                  style: FontStyles.mediumStyle(
                    fontSize: 17,
                    fontFamily: 'Montserrat',
                    color: Color(0xff0E0900),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Стоимость блюд',
                    style: FontStyles.regularStyle(
                      fontSize: 13,
                      fontFamily: 'Montserrat',
                      color: Color(0xff757475),
                    ),
                  ),
                  Text(
                    '124 000',
                    style: FontStyles.mediumStyle(
                      fontSize: 13,
                      fontFamily: 'Montserrat',
                      color: Color(0xff0E0900),
                    ),
                  ),
                ],
              ),
              sendIndex == 1 ? Container() : SizedBox(height: 12),
              sendIndex == 1
                  ? Container()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Доставка',
                          style: FontStyles.regularStyle(
                            fontSize: 13,
                            fontFamily: 'Montserrat',
                            color: Color(0xff757475),
                          ),
                        ),
                        Text(
                          '10 000',
                          style: FontStyles.mediumStyle(
                            fontSize: 13,
                            fontFamily: 'Montserrat',
                            color: Color(0xff0E0900),
                          ),
                        ),
                      ],
                    ),
              SizedBox(height: 12),
              Divider(
                color: Color(0xff757475),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Итого',
                    style: FontStyles.mediumStyle(
                      fontSize: 15,
                      fontFamily: 'Montserrat',
                      color: Color(0xff0E0900),
                    ),
                  ),
                  Text(
                    '134 000',
                    style: FontStyles.mediumStyle(
                      fontSize: 15,
                      fontFamily: 'Montserrat',
                      color: Color(0xff0E0900),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
