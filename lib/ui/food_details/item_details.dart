import 'package:HAMD/ObxHelper/counterState.dart';
import 'package:HAMD/ObxHelper/product_by_category.dart';
import 'package:HAMD/constants/fonts.dart';

import 'package:HAMD/ui/componants/my_appbar.dart';
import 'package:HAMD/ui/food_details/widgets/item_description.dart';
import 'package:HAMD/ui/food_details/widgets/item_position.dart';

import 'package:HAMD/ui/food_details/widgets/price_and_button.dart';
import 'package:HAMD/ui/food_details/widgets/rating_and_time.dart';
import 'package:flutter/material.dart';
import 'package:HAMD/constants/colors.dart';

import 'package:get/get.dart';

class ItemDetailsScreen extends StatelessWidget {
  final ProductByCategoryController productByCategoryController =
      Get.find<ProductByCategoryController>();
  final CounterClass counterState = Get.find<CounterClass>();
  @override
  Widget build(BuildContext context) {
    var recievedIndex = Get.arguments;
    print('recieved:');
    print(recievedIndex);
    return Scaffold(
      appBar: PreferredSize(
          child: customAppBar(
            context,
            icon1Url: 'assets/icons/Icon-left.svg',
            height1: 14,
            width1: 14,
            onpress1: () => Get.back(),
            title: 'Лаваш Средний',
            icon2Url: 'assets/icons/shopping-cart.svg',
            width2: 25,
            height2: 25,
            onpress2: () => Get.toNamed('/cart-screen'),
          ),
          preferredSize: Size.fromHeight(
              kToolbarHeight + MediaQuery.of(context).viewPadding.top)),
      backgroundColor: ColorPalatte.mainPageColor,
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Obx(
              () {
                if (productByCategoryController.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Column(
                    children: [
                      SizedBox(height: 7),
                      // MainContent(),

                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 70),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                'http://hamd.loko.uz/' +
                                    productByCategoryController
                                        .productByCategoryList[recievedIndex]
                                        .photo,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),

                      Expanded(
                        child: Stack(
                          overflow: Overflow.visible,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 25, right: 30),
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
                                    Spacer(),
                                    PriceAndButton(
                                      id: productByCategoryController
                                          .productByCategoryList[recievedIndex]
                                          .id,
                                      price: productByCategoryController
                                          .productByCategoryList[recievedIndex]
                                          .price
                                          .toString(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ItemPosition(),
                          ],
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
