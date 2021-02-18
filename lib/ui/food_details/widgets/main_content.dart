import 'package:HAMD/constants/fonts.dart';
import 'package:HAMD/ui/food_details/widgets/item_image.dart';
import 'package:HAMD/ui/food_details/widgets/item_position.dart';
import 'package:HAMD/ui/food_details/widgets/item_title.dart';
import 'package:HAMD/ui/food_details/widgets/price_and_button.dart';
import 'package:HAMD/ui/food_details/widgets/rating_and_time.dart';
import 'package:flutter/material.dart';

import 'item_description.dart';

class MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              //ItemTitle(),
              SizedBox(height: 0),
              Column(
                children: [
                  ItemImage(),
                  //SizedBox(height: 30),
                  Stack(
                    overflow: Overflow.visible,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25, right: 30),
                          child: Column(
                            children: [
                              RatingAndItem(),
                              SizedBox(
                                height: 20,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Описание блюда',
                                  style: FontStyles.mediumStyle(
                                    fontSize: 18,
                                    fontFamily: 'Poppins',
                                    color: Color(0xff222E54),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                child: ItemDescription(),
                              ),
                              SizedBox(height: 20),
                              PriceAndButton(),
                            ],
                          ),
                        ),
                      ),
                      ItemPosition(),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
