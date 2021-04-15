import 'package:HAMD/ObxHelper/counterState.dart';
import 'package:HAMD/ObxHelper/favoritte.dart';
import 'package:HAMD/ObxHelper/product_by_category.dart';
import 'package:HAMD/constants/fonts.dart';
import 'package:HAMD/services/add_cart_post.dart';

import 'package:HAMD/ui/componants/my_appbar.dart';
import 'package:HAMD/ui/food_details/widgets/item_description.dart';

import 'package:HAMD/ui/food_details/widgets/rating_and_time.dart';
import 'package:flutter/material.dart';
import 'package:HAMD/constants/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

class ItemDetailsScreen extends StatefulWidget {
  @override
  _ItemDetailsScreenState createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  final ProductByCategoryController productByCategoryController =
      Get.find<ProductByCategoryController>();

  final CounterClass counterState = Get.find<CounterClass>();

  final FavoriteState favoriteState = Get.put(FavoriteState());
  int count = 1;

  @override
  Widget build(BuildContext context) {
    var recievedIndex = ModalRoute.of(context).settings.arguments;
    print('recieved:');
    print(recievedIndex);
    return Scaffold(
      appBar: PreferredSize(
          child: customAppBar(
            context,
            isCart: true,
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
                                    // PriceAndButton(
                                    //   id: productByCategoryController
                                    //       .productByCategoryList[recievedIndex]
                                    //       .id,
                                    //   price: productByCategoryController
                                    //       .productByCategoryList[recievedIndex]
                                    //       .price
                                    //       .toString(),
                                    // ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Цена',
                                                style: FontStyles.mediumStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xff222E54),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              Text(
                                                '${productByCategoryController.productByCategoryList[recievedIndex].price} сум',
                                                style: FontStyles.regularStyle(
                                                  fontSize: 26,
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xff222E54),
                                                ),
                                              ),
                                            ],
                                          ),
                                          GestureDetector(
                                              child: Align(
                                                alignment: Alignment.topRight,
                                                child: counterState
                                                        .loading.value
                                                    ? CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          ColorPalatte
                                                              .strongRedColor,
                                                        ),
                                                      )
                                                    : SvgPicture.asset(
                                                        'assets/icons/plus.svg',
                                                        width: 50,
                                                        height: 50,
                                                      ),
                                              ),
                                              onTap: () {
                                                counterState.onFetching();

                                                // int amount = counterClass.count.value;

                                                print('adding to car id:');
                                                print(
                                                    productByCategoryController
                                                        .productByCategoryList[
                                                            recievedIndex]
                                                        .id);
                                                print('amount');

                                                AddCartPostService.addCartPostService(
                                                    amount: count,
                                                    productId:
                                                        productByCategoryController
                                                            .productByCategoryList[
                                                                recievedIndex]
                                                            .id);
                                                // Get.to(CartScreen());
                                              }),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // ItemPosition(),
                            Positioned(
                              top: -20.0,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * .8,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 129.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xff9F111B),
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                              child: IconButton(
                                                onPressed: () {
                                                  if (count > 1) {
                                                    setState(() {
                                                      count--;
                                                    });
                                                    print(count);
                                                  }
                                                },
                                                icon: Icon(
                                                  Icons.remove,
                                                  size: 16,
                                                ),
                                                color: Color(0xff9F111B),
                                              ),
                                            ),
                                            Text(
                                              count.toString(),
                                              style: FontStyles.mediumStyle(
                                                fontSize: 24,
                                                fontFamily: 'Poppins',
                                                color: Color(0xffFFFFFF),
                                              ),
                                            ),
                                            Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                              child: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    count++;
                                                  });
                                                },
                                                icon: Icon(
                                                  Icons.add,
                                                  size: 16,
                                                ),
                                                color: Color(0xff9F111B),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: Colors.white,
                                          ),
                                          child: Obx(
                                            () => IconButton(
                                                icon: Icon(Icons.favorite),
                                                color:
                                                    favoriteState.favorite.value
                                                        ? Color(0xff9F111B)
                                                        : Colors.grey,
                                                onPressed: () {
                                                  favoriteState.doFavotie();
                                                }),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
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
