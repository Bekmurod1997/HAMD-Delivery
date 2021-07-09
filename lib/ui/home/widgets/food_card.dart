import 'package:HAMD/ObxHelper/all_products_controller.dart';
import 'package:HAMD/ObxHelper/product_by_category.dart';
import 'package:HAMD/constants/colors.dart';
import 'package:HAMD/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class FoodCard extends StatefulWidget {
  int selectedCategory;
  FoodCard({@required this.selectedCategory});
  @override
  _FoodCardState createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  int itemDetailsIndex = 0;
  final AllProductsController allProductsController =
      Get.find<AllProductsController>();

  final ProductByCategoryController productByCategoryController =
      Get.find<ProductByCategoryController>();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Obx(
      () {
        if (productByCategoryController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(ColorPalatte.strongRedColor),
            ),
          );
        } else {
          return productByCategoryController.productByCategoryList.length > 0
              ? Container(
                  height: 400.0,
                  child: ListView.separated(
                    itemCount: productByCategoryController
                        .productByCategoryList.length,
                    separatorBuilder: (context, index) => SizedBox(width: 0),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      String productName = productByCategoryController
                          .productByCategoryList[index].name;
                      var myArr = productName.split(' ');

                      return GestureDetector(
                        onTap: () {
                          print('index');
                          print(productByCategoryController
                              .productByCategoryList[index].id);

                          print('itemindex');
                          print(productByCategoryController
                              .productByCategoryList[index].id);
                          Get.toNamed('/product-detail-screen',
                              arguments: index);
                        },
                        child: Padding(
                          padding: index == 0
                              ? EdgeInsets.only(left: 24, right: 13)
                              : EdgeInsets.only(right: 23),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                            ),
                            width: productByCategoryController
                                        .productByCategoryList.length ==
                                    1
                                ? screenSize.width * 0.88
                                : screenSize.width * 0.86,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 0, right: 0, top: 20),
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: screenSize.width * 0.76,
                                        height: screenSize.height * 0.23,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          color: Color(0xffEDF0F3),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                'http://hamd.loko.uz/' +
                                                    productByCategoryController
                                                        .productByCategoryList[
                                                            index]
                                                        .photo,
                                              ),
                                              fit: BoxFit.contain),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 10,
                                        left: 15,
                                        child: Container(
                                          height: 35,
                                          width: 52,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: Colors.white),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text('5.0'),
                                              SizedBox(width: 3.0),
                                              SvgPicture.asset(
                                                'assets/icons/star.svg',
                                                width: 16,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              if (myArr.length == 1 ||
                                                  myArr.length == 2)
                                                Text(
                                                  productByCategoryController
                                                      .productByCategoryList[
                                                          index]
                                                      .name,
                                                  style:
                                                      FontStyles.semiBoldStyle(
                                                    fontSize: 16,
                                                    fontFamily: 'Ubuntu',
                                                    color: Color(0xff222E54),
                                                  ),
                                                ),
                                              if (myArr.length == 3)
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      myArr[0] + ' ' + myArr[1],
                                                      style: FontStyles
                                                          .semiBoldStyle(
                                                        fontSize: 16,
                                                        fontFamily: 'Ubuntu',
                                                        color:
                                                            Color(0xff222E54),
                                                      ),
                                                    ),
                                                    Text(
                                                      myArr[2],
                                                      style: FontStyles
                                                          .semiBoldStyle(
                                                        fontSize: 16,
                                                        fontFamily: 'Ubuntu',
                                                        color:
                                                            Color(0xff222E54),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              if (myArr.length == 4)
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      myArr[0] + ' ' + myArr[1],
                                                      style: FontStyles
                                                          .semiBoldStyle(
                                                        fontSize: 16,
                                                        fontFamily: 'Ubuntu',
                                                        color:
                                                            Color(0xff222E54),
                                                      ),
                                                    ),
                                                    Text(
                                                      myArr[2] + ' ' + myArr[3],
                                                      style: FontStyles
                                                          .semiBoldStyle(
                                                        fontSize: 16,
                                                        fontFamily: 'Ubuntu',
                                                        color:
                                                            Color(0xff222E54),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              if (myArr.length == 5)
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      myArr[0] + ' ' + myArr[1],
                                                      style: FontStyles
                                                          .semiBoldStyle(
                                                        fontSize: 16,
                                                        fontFamily: 'Ubuntu',
                                                        color:
                                                            Color(0xff222E54),
                                                      ),
                                                    ),
                                                    Text(
                                                      myArr[2] + ' ' + myArr[3],
                                                      style: FontStyles
                                                          .semiBoldStyle(
                                                        fontSize: 16,
                                                        fontFamily: 'Ubuntu',
                                                        color:
                                                            Color(0xff222E54),
                                                      ),
                                                    ),
                                                    Text(
                                                      myArr[4],
                                                      style: FontStyles
                                                          .semiBoldStyle(
                                                        fontSize: 16,
                                                        fontFamily: 'Ubuntu',
                                                        color:
                                                            Color(0xff222E54),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              if (myArr.length == 6)
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      myArr[0] + ' ' + myArr[1],
                                                      style: FontStyles
                                                          .semiBoldStyle(
                                                        fontSize: 16,
                                                        fontFamily: 'Ubuntu',
                                                        color:
                                                            Color(0xff222E54),
                                                      ),
                                                    ),
                                                    Text(
                                                      myArr[2] + ' ' + myArr[3],
                                                      style: FontStyles
                                                          .semiBoldStyle(
                                                        fontSize: 16,
                                                        fontFamily: 'Ubuntu',
                                                        color:
                                                            Color(0xff222E54),
                                                      ),
                                                    ),
                                                    Text(
                                                      myArr[4] + ' ' + myArr[5],
                                                      style: FontStyles
                                                          .semiBoldStyle(
                                                        fontSize: 16,
                                                        fontFamily: 'Ubuntu',
                                                        color:
                                                            Color(0xff222E54),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                            ],
                                          ),
                                          Text(
                                            productByCategoryController
                                                    .productByCategoryList[
                                                        index]
                                                    .price
                                                    .toString() +
                                                ' ' +
                                                'sum'.tr,
                                            style: FontStyles.semiBoldStyle(
                                              fontSize: 16,
                                              fontFamily: 'Ubuntu',
                                              color: Color(0xffA01721),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      SizedBox(
                                        child: Text(
                                          productByCategoryController
                                              .productByCategoryList[index]
                                              .description,
                                          style: FontStyles.semiBoldStyle(
                                            fontSize: 12,
                                            fontFamily: 'Montserrat',
                                            color: Color(0xffA4ABB9),
                                          ),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/icons/deliver.svg'),
                                          SizedBox(width: 5),
                                          Text(
                                            'От 10 000 ' + 'sum'.tr,
                                            style: FontStyles.regularStyle(
                                              fontSize: 11,
                                              fontFamily: 'Ubuntu',
                                              color: Color(0xff494D6D),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/icons/clock.svg'),
                                          SizedBox(width: 5),
                                          Text(
                                            '10-15 ' + 'minutes'.tr,
                                            style: FontStyles.regularStyle(
                                              fontSize: 11,
                                              fontFamily: 'Ubuntu',
                                              color: Color(0xff494D6D),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/icons/plus.svg',
                                            width: 35,
                                            height: 35,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              : Text('Товаров пока нет');
        }
      },
    );
  }
}
