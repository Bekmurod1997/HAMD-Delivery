import 'package:HAMD/constants/colors.dart';
import 'package:HAMD/ui/cart/cart_screen.dart';
import 'package:HAMD/ui/componants/my_appbar.dart';
import 'package:HAMD/ui/home/widgets/category_buttons.dart';
import 'package:HAMD/ui/home/widgets/food_card.dart';
import 'package:HAMD/ui/home/widgets/user_welcome_item.dart';
import 'package:HAMD/ui/user/user_screen.dart';
import 'package:flutter/material.dart';
import '../componants/header.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorPalatte.mainPageColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Header(
            width1: 9,
            height1: 9,
            width2: 25,
            height2: 25,
            icon1Url: 'assets/icons/drawer.svg',
            title: 'Основное меню',
            icon2Url: 'assets/icons/shopping-cart.svg',
            onpress1: () => Get.to(UserScreen()),
            onpress2: () => Get.to(CartScreen()),
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 1,
                itemBuilder: (context, index) => Column(
                      children: [
                        UserWelcomeItem(),
                        SizedBox(height: 20),
                        CategoryButtons(),
                        SizedBox(height: 20),
                        FoodCard(),
                        SizedBox(height: 20),
                      ],
                    )),
          ),
        ],
      ),
    );
  }
}
