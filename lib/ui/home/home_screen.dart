import 'package:HAMD/ObxHelper/item_category_controller.dart';
import 'package:HAMD/ObxHelper/profile_controller.dart';
import 'package:HAMD/constants/colors.dart';
import 'package:HAMD/ui/componants/my_appbar.dart';
import 'package:HAMD/ui/home/widgets/category_buttons.dart';
import 'package:HAMD/ui/home/widgets/food_card.dart';
import 'package:HAMD/ui/home/widgets/user_welcome_item.dart';
import 'package:HAMD/ui/user/user_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
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
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('on message $message');
        final snackBar = SnackBar(
          content: Text(message.toString()),
          action: SnackBarAction(
            label: 'Принять',
            onPressed: () => null,
          ),
        );
        Scaffold.of(context).showSnackBar(snackBar);
        // setState(() {
        //   _messageTitle = message['notification']['title'];
        // });

        // showInSnackBar(value: _messageTitle);
        // showDialog(context: context, child: Text(_messageTitle));
        // showDialog(context: context, child: Text("RECIEVED"));
      },
      onResume: (message) async {
        print('on resume $message');
        // showDialog(context: context, child: Text("Resumed"));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalatte.mainPageColor,
      appBar: PreferredSize(
          child: customAppBar(
            context,
            isCart: true,
            icon1Url: 'assets/icons/drawer.svg',
            height1: 10,
            width1: 10,
            onpress1: () => Get.to(UserScreen()),
            title: 'Главная',
            icon2Url: 'assets/icons/shopping-cart.svg',
            width2: 25,
            height2: 25,
            onpress2: () => Get.toNamed('/cart-screen'),
          ),
          preferredSize: Size.fromHeight(
              kToolbarHeight + MediaQuery.of(context).viewPadding.top)),
      body: Obx(
        () {
          if (ppController.isLoading.value || categoryData.isLoading.value) {
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
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Column(
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
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: Text('error'),
            );
          }
        },
      ),
    );
  }
}
