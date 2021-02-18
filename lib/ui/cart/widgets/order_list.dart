import 'package:HAMD/constants/fonts.dart';
import 'package:HAMD/ui/pamentStatus/payment_status_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class OrderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        height: 30,
      ),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (context, index) => InkWell(
        onTap: () => Get.to(PaymentStatusScreen()),
        child: Container(
          width: screenSize.width * 0.8,
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25), color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Image.asset('assets/food/lavash.png'),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Лаваш',
                            style: FontStyles.boldStyle(
                              fontSize: 18,
                              fontFamily: 'Montserrat',
                              color: Color(0xff222E54),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Средний Лаваш',
                            style: FontStyles.regularStyle(
                              fontSize: 10,
                              fontFamily: 'Popins',
                              color: Color(0xffA4ABB9),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '54 000',
                              style: FontStyles.semiBoldStyle(
                                fontSize: 18,
                                fontFamily: 'Poppins',
                                color: Color(0xff222E54),
                              ),
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  child: SvgPicture.asset(
                                    'assets/icons/minus.svg',
                                    height: 25,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  '2',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                GestureDetector(
                                  child: SvgPicture.asset(
                                    'assets/icons/plus.svg',
                                    height: 27,
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
