import 'package:HAMD/ObxHelper/all_products_controller.dart';
import 'package:HAMD/ObxHelper/item_category_controller.dart';
import 'package:HAMD/ObxHelper/product_by_category.dart';
import 'package:HAMD/ObxHelper/profile_controller.dart';
import 'package:HAMD/locales/strings.dart';
import 'package:HAMD/ui/home/home_screen.dart';
import 'package:HAMD/utils/my_prefs.dart';

import 'package:flutter/material.dart';

import 'package:get/route_manager.dart';
import 'package:get/get.dart';

import 'ui/landing/landing_screen.dart';

import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CategoryItemController categoryController =
      Get.put(CategoryItemController());

  final UserProfileController profileController =
      Get.put(UserProfileController());
  final AllProductsController allProductsController =
      Get.put(AllProductsController());
  final ProductByCategoryController productByCategoryController =
      Get.put(ProductByCategoryController());
  var secondToken = MyPref.secondToken ?? '';

  @override
  void initState() {
    print('Second Token: $secondToken');
    if (secondToken != null && secondToken != '') {
      profileController.fetchProfileData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // accentColor: Colors.transparent.withOpacity(0),
      ),
      home: MyPref.secondToken == null ? LandingScreen() : HomeScreen(),
      //home: HomeScreen(),
      translations: Strings(),
      locale: Locale("uz", "UZ"),
      fallbackLocale: Locale("uz", "UZ"),
    );
  }
}
