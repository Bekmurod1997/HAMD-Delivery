import 'package:HAMD/ObxHelper/add_cart_controller.dart';
import 'package:HAMD/ObxHelper/cart_list_controller.dart';
import 'package:HAMD/constants/colors.dart';
import 'package:HAMD/constants/fonts.dart';
import 'package:HAMD/services/delete_from_cart.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class OrderList extends StatefulWidget {
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  final AddCartController addCartController = Get.find<AddCartController>();

  static CartListController cartListController = Get.find<CartListController>();

  @override
  void initState() {
    cartListController.fetchAllCartList();
    // ignore: unused_local_variable
    var productsLength = cartListController.allCartList.length;

    super.initState();
  }

  var productsAmount = List<int>.generate(cartListController.allCartList.length,
      (i) => cartListController.allCartList[i].amount);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (cartListController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            ),
          );
        } else {
          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              height: 30,
            ),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: cartListController.allCartList.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: Image.network('http://hamd.loko.uz/' +
                                  cartListController
                                      .allCartList[index].productPhoto),
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
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      cartListController
                                          .allCartList[index].productName,
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
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        cartListController
                                            .allCartList[index].productPrice
                                            .toString(),
                                        style: FontStyles.semiBoldStyle(
                                          fontSize: 18,
                                          fontFamily: 'Poppins',
                                          color: Color(0xff222E54),
                                        ),
                                      ),
                                      // Row(
                                      //   children: [
                                      //     GestureDetector(
                                      //       onTap: () => setState(() {
                                      //         cartListController
                                      //             .allCartList[index].amount--;
                                      //       }),
                                      //       child: SvgPicture.asset(
                                      //         'assets/icons/minus.svg',
                                      //         height: 25,
                                      //       ),
                                      //     ),
                                      //     SizedBox(
                                      //       width: 8,
                                      //     ),
                                      //     Text(
                                      //       cartListController
                                      //           .allCartList[index].amount
                                      //           .toString(),
                                      //       style: TextStyle(fontSize: 18),
                                      //     ),
                                      //     SizedBox(
                                      //       width: 8,
                                      //     ),
                                      //     GestureDetector(
                                      //       child: SvgPicture.asset(
                                      //         'assets/icons/plus.svg',
                                      //         height: 27,
                                      //       ),
                                      //     ),
                                      //   ],
                                      // )
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
                  Positioned(
                      top: -5,
                      right: -5,
                      child: IconButton(
                        iconSize: 30.0,
                        color: ColorPalatte.strongRedColor,
                        icon: Icon(Icons.cancel),
                        onPressed: () {
                          DeleteFromCart.deleteFromCart(cartListController
                              .allCartList[index].productId
                              .toString());
                          cartListController.fetchAllCartList();
                          Get.offAndToNamed('/cart-screen');
                          print('deleted');
                        },
                      ))
                ],
              );
            },
          );
        }
      },
    );
  }
}
