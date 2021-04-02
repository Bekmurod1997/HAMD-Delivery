import 'package:HAMD/ui/cart/cart_screen.dart';
import 'package:HAMD/ui/food_details/item_details.dart';
import 'package:HAMD/ui/home/home_screen.dart';
import 'package:HAMD/ui/pamentStatus/payment_status_screen.dart';
import 'package:HAMD/ui/payment/payment_scren.dart';
import 'package:HAMD/ui/user/user_screen.dart';
import 'package:HAMD/ui/user/widgets/edit_profile.dart';
import 'package:get/get.dart';

class PageList {
  static List<GetPage> page = [
    GetPage(name: '/home-screen', page: () => HomeScreen()),
    GetPage(name: '/product-detail-screen', page: () => ItemDetailsScreen()),
    GetPage(name: '/cart-screen', page: () => CartScreen()),
    GetPage(name: '/user-screen', page: () => UserScreen()),
    GetPage(name: '/edit-profile-screen', page: () => EditProfile()),
    GetPage(name: '/payment-screen', page: () => PaymentScreen()),
    GetPage(name: '/payment-status-screen', page: () => PaymentStatusScreen()),
  ];
}
