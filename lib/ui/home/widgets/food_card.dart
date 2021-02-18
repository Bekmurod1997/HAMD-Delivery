import 'package:HAMD/constants/fonts.dart';
import 'package:HAMD/ui/food_details/item_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FoodCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Get.to(ItemDetails()),
      child: Container(
        height: screenSize.height * 0.48,
        width: double.infinity,
        child: ListView.separated(
          itemCount: 8,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Padding(
            padding: index == 0
                ? EdgeInsets.only(left: 24, right: 13)
                : EdgeInsets.only(right: 23),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
              width: screenSize.width * 0.8,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 0, right: 0, top: 20),
                    child: Container(
                      width: screenSize.height * 0.33,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color(0xffEDF0F3),
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(25),
                            child: Center(
                              child: Image.asset(
                                'assets/food/lavash.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 15,
                            child: Container(
                              height: 35,
                              width: 52,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('4.5'),
                                  SizedBox(width: 3.0),
                                  SvgPicture.asset(
                                    'assets/icons/star.svg',
                                    width: 16,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Лаваш Средний',
                              style: FontStyles.semiBoldStyle(
                                fontSize: 16,
                                fontFamily: 'Ubuntu',
                                color: Color(0xff222E54),
                              ),
                            ),
                            Text(
                              '27 000',
                              style: FontStyles.semiBoldStyle(
                                fontSize: 16,
                                fontFamily: 'Ubuntu',
                                color: Color(0xffA01721),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          child: Text(
                            'Ближневосточное блюдо из мяса, обжаренного на вертеле, завёрнутого в лаваш, с добавлением специй, соусов и салата из свежих овощей. Употребляется без использования столовых приборов.',
                            style: FontStyles.semiBoldStyle(
                              fontSize: 12,
                              fontFamily: 'Montserrat',
                              color: Color(0xffA4ABB9),
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset('assets/icons/deliver.svg'),
                                SizedBox(width: 5),
                                Text(
                                  'От 10 000 сум',
                                  style: FontStyles.regularStyle(
                                    fontSize: 11,
                                    fontFamily: 'Ubuntu',
                                    color: Color(0xff494D6D),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset('assets/icons/clock.svg'),
                                SizedBox(width: 5),
                                Text(
                                  '10-15 мин',
                                  style: FontStyles.regularStyle(
                                    fontSize: 11,
                                    fontFamily: 'Ubuntu',
                                    color: Color(0xff494D6D),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/plus.svg',
                                  width: 35,
                                  height: 35,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          separatorBuilder: (context, index) => SizedBox(width: 0),
        ),
      ),
    );
  }
}
