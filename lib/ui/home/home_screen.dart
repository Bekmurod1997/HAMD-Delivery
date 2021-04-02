import 'package:HAMD/ObxHelper/item_category_controller.dart';
import 'package:HAMD/ObxHelper/profile_controller.dart';
import 'package:HAMD/constants/colors.dart';
import 'package:HAMD/ui/componants/my_appbar.dart';
import 'package:HAMD/ui/home/widgets/category_buttons.dart';
import 'package:HAMD/ui/home/widgets/food_card.dart';
import 'package:HAMD/ui/home/widgets/user_welcome_item.dart';
import 'package:flutter/material.dart';
import '../componants/header.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCategory = 1;
  final UserProfileController ppController = Get.find<UserProfileController>();

  final CategoryItemController categoryData =
      Get.find<CategoryItemController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalatte.mainPageColor,
      appBar: PreferredSize(
          child: customAppBar(
            context,
            width1: 9,
            height1: 9,
            width2: 25,
            height2: 25,
            icon1Url: 'assets/icons/drawer.svg',
            title: 'Основное меню',
            icon2Url: 'assets/icons/shopping-cart.svg',
            onpress1: () => Get.toNamed('/user-screen'),
            onpress2: () => Get.toNamed('/cart-screen'),
          ),
          preferredSize: Size.fromHeight(
              kToolbarHeight + MediaQuery.of(context).viewPadding.top)),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Obx(
              () {
                if (ppController.isLoading.value ||
                    categoryData.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                    ),
                  );
                } else if (!ppController.isLoading.value &&
                    !categoryData.isLoading.value &&
                    ppController.profileList.isNotEmpty &&
                    categoryData.categoryList.isNotEmpty) {
                  return Column(
                    children: [
                      UserWelcomeItem(),
                      SizedBox(height: 20),
                      CategoryButtons(
                        selectedCategory: selectedCategory,
                      ),
                      SizedBox(height: 20),
                      FoodCard(
                        selectedCategory: selectedCategory,
                      ),
                      SizedBox(height: 20),
                    ],
                  );
                }
                return Center(
                  child: Text('Error'),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
