import 'package:HAMD/ObxHelper/add_cart_controller.dart';
import 'package:HAMD/ObxHelper/cart_list_controller.dart';
import 'package:HAMD/constants/fonts.dart';
import 'package:HAMD/services/add_cart_post.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

    super.initState();
  }

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
                                          fontSize: 16,
                                          fontFamily: 'Poppins',
                                          color: Color(0xff222E54),
                                        ),
                                      ),
                                      // Text(
                                      //   cartListController
                                      //           .allCartList[index].amount
                                      //           .toString() +
                                      //       ' x ' +
                                      //       cartListController
                                      //           .allCartList[index].productPrice
                                      //           .toString() +
                                      //       ' сум ',
                                      //   style: FontStyles.semiBoldStyle(
                                      //     fontSize: 18,
                                      //     fontFamily: 'Poppins',
                                      //     color: Color(0xff222E54),
                                      //   ),
                                      // ),
                                      //
                                      //
                                      //
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              if (cartListController
                                                      .allCartList[index]
                                                      .amount >
                                                  1) {
                                                setState(() {
                                                  cartListController
                                                      .allCartList[index]
                                                      .amount--;
                                                });
                                              }
                                              AddCartPostService
                                                  .addCartPostService(
                                                amount: cartListController
                                                    .allCartList[index].amount,
                                                productId: cartListController
                                                    .allCartList[index]
                                                    .productId,
                                              );
                                            },
                                            child: SvgPicture.asset(
                                              'assets/icons/minus.svg',
                                              height: 25,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            cartListController
                                                .allCartList[index].amount
                                                .toString(),
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                cartListController
                                                    .allCartList[index]
                                                    .amount++;
                                              });
                                              AddCartPostService
                                                  .addCartPostService(
                                                amount: cartListController
                                                    .allCartList[index].amount,
                                                productId: cartListController
                                                    .allCartList[index]
                                                    .productId,
                                              );
                                            },
                                            child: SvgPicture.asset(
                                              'assets/icons/plus.svg',
                                              height: 27,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          // Expanded(
                          //   flex: 1,
                          //   child: Column(
                          //     mainAxisAlignment: MainAxisAlignment.start,
                          //     children: [
                          //       IconButton(
                          //         icon: Icon(
                          //           Icons.delete,
                          //           color: ColorPalatte.strongRedColor,
                          //         ),
                          //         onPressed: () async {
                          //           await DeleteFromCart.deleteFromCart(
                          //               cartListController
                          //                   .allCartList[index].productId
                          //                   .toString());
                          //           cartListController.fetchAllCartList();
                          //         },
                          //       ),
                          //       GestureDetector(
                          //         onTap: () {
                          //           setState(() {
                          //             if (cartListController
                          //                     .allCartList[index].amount >
                          //                 1) {
                          //               cartListController
                          //                   .allCartList[index].amount--;
                          //             }
                          //           });
                          //           AddCartPostService.addCartPostService(
                          //             amount: cartListController
                          //                 .allCartList[index].amount,
                          //             productId: cartListController
                          //                 .allCartList[index].productId,
                          //           );
                          //         },
                          //         child: SvgPicture.asset(
                          //           'assets/icons/minus.svg',
                          //           height: 25,
                          //         ),
                          //       ),
                          //       SizedBox(
                          //         width: 8,
                          //       ),
                          //       Text(
                          //         cartListController.allCartList[index].amount
                          //             .toString(),
                          //         style: TextStyle(fontSize: 18),
                          //       ),
                          //       SizedBox(
                          //         width: 8,
                          //       ),
                          //       GestureDetector(
                          //         onTap: () {
                          //           setState(() {
                          //             cartListController
                          //                 .allCartList[index].amount++;
                          //           });
                          //           AddCartPostService.addCartPostService(
                          //             amount: cartListController
                          //                 .allCartList[index].amount,
                          //             productId: cartListController
                          //                 .allCartList[index].productId,
                          //           );
                          //         },
                          //         child: SvgPicture.asset(
                          //           'assets/icons/plus.svg',
                          //           height: 27,
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  // Positioned(
                  //     top: -5,
                  //     right: -5,
                  //     child: IconButton(
                  //       iconSize: 30.0,
                  //       color: ColorPalatte.strongRedColor,
                  //       icon: Icon(Icons.cancel),
                  //       onPressed: () async {
                  //         await DeleteFromCart.deleteFromCart(cartListController
                  //             .allCartList[index].productId
                  //             .toString());
                  //         cartListController.fetchAllCartList();
                  //       },
                  //     ))
                ],
              );
            },
          );
        }
      },
    );
  }
}
