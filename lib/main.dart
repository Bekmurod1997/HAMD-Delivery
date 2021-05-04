import 'package:HAMD/ObxHelper/add_cart_controller.dart';
import 'package:HAMD/ObxHelper/all_products_controller.dart';
import 'package:HAMD/ObxHelper/cart_list_controller.dart';
import 'package:HAMD/ObxHelper/counterState.dart';
import 'package:HAMD/ObxHelper/delivert_type_controller.dart';
import 'package:HAMD/ObxHelper/item_category_controller.dart';
import 'package:HAMD/ObxHelper/list_of_orders.dart';
import 'package:HAMD/ObxHelper/orderLoader.dart';
import 'package:HAMD/ObxHelper/order_detail_view_controller.dart';
import 'package:HAMD/ObxHelper/payment_type_controller.dart';
import 'package:HAMD/ObxHelper/plastic_card_humo_controller.dart';
import 'package:HAMD/ObxHelper/plastic_card_type_controller.dart';
import 'package:HAMD/ObxHelper/plastic_card_universal_controller.dart';
import 'package:HAMD/ObxHelper/platic_card_controller.dart';
import 'package:HAMD/ObxHelper/product_by_category.dart';
import 'package:HAMD/ObxHelper/profile_controller.dart';
import 'package:HAMD/constants/page_list.dart';
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
  final AllProductsController allProductsController =
      Get.put(AllProductsController());
  final CounterClass counterState = Get.put(CounterClass());
  final UserProfileController profileController =
      Get.put(UserProfileController());
  final ProductByCategoryController productByCategoryController =
      Get.put(ProductByCategoryController());
  final AddCartController addCartController = Get.put(AddCartController());
  final DelivertyTypeController delivertyTypeController =
      Get.put(DelivertyTypeController());
  final PaymentTypeController paymnetTypeController =
      Get.put(PaymentTypeController());

  final OrderDetailViewController orderDetailViewController =
      Get.put(OrderDetailViewController());
  final listOfAllOrdersControllers = Get.put(ListOfAllOrdersControllers());
  final CartListController cartListController = Get.put(CartListController());
  final PlaticCardController platicCardController =
      Get.put(PlaticCardController());
  final PlasticCardTypeController plasticCardType =
      Get.put(PlasticCardTypeController());
  final PlasticCardHumoController plasticCardHumoController =
      Get.put(PlasticCardHumoController());
  final PlasticCardUniversalController plasticCardUniversalController =
      Get.put(PlasticCardUniversalController());
  final OrderLoaderController orderLoaderController =
      Get.put(OrderLoaderController());
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
      getPages: PageList.page,
      //home: HomeScreen(),
      translations: Strings(),
      locale: Locale("uz", "UZ"),
      fallbackLocale: Locale("uz", "UZ"),
    );
  }
}
