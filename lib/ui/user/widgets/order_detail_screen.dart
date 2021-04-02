import 'package:HAMD/ObxHelper/order_detail_view_controller.dart';
import 'package:HAMD/constants/colors.dart';
import 'package:HAMD/constants/fonts.dart';
import 'package:HAMD/ui/componants/header.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class OrderDetailScreen extends StatefulWidget {
  //changed to final
  final int id;
  OrderDetailScreen({@required this.id});
  @override
  _OrderDetailScreenState createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  final OrderDetailViewController orderDetailViewController =
      Get.find<OrderDetailViewController>();

  @override
  void initState() {
    orderDetailViewController.fetchOrderDetailView(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var recieved = Get.arguments;
    return Scaffold(
      backgroundColor: ColorPalatte.mainPageColor,
      body: Column(
        children: [
          Header(
            hasAction: false,
            icon1Url: 'assets/icons/Icon-left.svg',
            onpress1: () => Get.back(),
            title: 'Список заказов',
            // icon2Url: 'assets/icons/pencil.svg',
            // onpress2: () => Get.to(EditProfile()),
            height2: 18,
            width2: 18,
          ),
          Expanded(
            child: Obx(
              () {
                if (orderDetailViewController.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return orderDetailViewController
                          .orderDetailViewList.first.orderProducts.isNotEmpty
                      ? Column(
                          children: [
                            ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(
                                height: 20,
                              ),
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: orderDetailViewController
                                  .orderDetailViewList
                                  .first
                                  .orderProducts
                                  .length,
                              itemBuilder: (context, index) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: InkWell(
                                  // onTap: () => Get.to(PaymentStatusScreen()),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: Colors.white),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              child: Image.network(
                                                  'http://hamd.loko.uz/' +
                                                      orderDetailViewController
                                                          .orderDetailViewList
                                                          .first
                                                          .orderProducts[index]
                                                          .product
                                                          .photo),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  SizedBox(height: 20),
                                                  Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      orderDetailViewController
                                                          .orderDetailViewList
                                                          .first
                                                          .orderProducts[index]
                                                          .product
                                                          .name,
                                                      style:
                                                          FontStyles.boldStyle(
                                                        fontSize: 18,
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            Color(0xff222E54),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      orderDetailViewController
                                                          .orderDetailViewList
                                                          .first
                                                          .orderProducts[index]
                                                          .product
                                                          .name,
                                                      style: FontStyles
                                                          .regularStyle(
                                                        fontSize: 10,
                                                        fontFamily: 'Popins',
                                                        color:
                                                            Color(0xffA4ABB9),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        orderDetailViewController
                                                                .orderDetailViewList
                                                                .first
                                                                .orderProducts[
                                                                    index]
                                                                .count
                                                                .toString() +
                                                            ' x ' +
                                                            orderDetailViewController
                                                                .orderDetailViewList
                                                                .first
                                                                .orderProducts[
                                                                    index]
                                                                .product
                                                                .price
                                                                .toString() +
                                                            'сум',
                                                        style: FontStyles
                                                            .semiBoldStyle(
                                                          fontSize: 18,
                                                          fontFamily: 'Poppins',
                                                          color:
                                                              Color(0xff222E54),
                                                        ),
                                                      ),
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
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Стоимость блюд',
                                          style: FontStyles.mediumStyle(
                                            fontSize: 14,
                                            fontFamily: 'Montserrat',
                                            color: Color(0xff494D6D),
                                          ),
                                        ),
                                        Text(
                                          orderDetailViewController
                                                  .orderDetailViewList
                                                  .first
                                                  .productTotalSum
                                                  .toString() +
                                              ' сум ',
                                          style: FontStyles.mediumStyle(
                                            fontSize: 14,
                                            fontFamily: 'Montserrat',
                                            color: Color(0xff494D6D),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Доставка',
                                          style: FontStyles.mediumStyle(
                                            fontSize: 14,
                                            fontFamily: 'Montserrat',
                                            color: Color(0xff494D6D),
                                          ),
                                        ),
                                        Text(
                                          '10 000 сум ',
                                          style: FontStyles.mediumStyle(
                                            fontSize: 14,
                                            fontFamily: 'Montserrat',
                                            color: Color(0xff494D6D),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Итого',
                                          style: FontStyles.semiBoldStyle(
                                            fontSize: 18,
                                            fontFamily: 'Montserrat',
                                            color: Color(0xff9F111B),
                                          ),
                                        ),
                                        Text(
                                          orderDetailViewController
                                                  .orderDetailViewList
                                                  .first
                                                  .productTotalSum
                                                  .toString() +
                                              ' сум ',
                                          style: FontStyles.semiBoldStyle(
                                            fontSize: 18,
                                            fontFamily: 'Montserrat',
                                            color: Color(0xff9F111B),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      : Text('pustoy');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
