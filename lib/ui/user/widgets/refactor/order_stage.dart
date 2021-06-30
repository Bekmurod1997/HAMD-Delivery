import 'package:HAMD/ObxHelper/order_detail_view_controller.dart';
import 'package:HAMD/constants/colors.dart';
import 'package:HAMD/constants/fonts.dart';
import 'package:HAMD/ui/componants/header.dart';
import 'package:HAMD/ui/home/home_screen.dart';
import 'package:HAMD/ui/pamentStatus/widgets/stages.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class OrderStageScreen extends StatefulWidget {
  final int id;
  OrderStageScreen({@required this.id});
  @override
  _OrderStageScreenState createState() => _OrderStageScreenState();
}

class _OrderStageScreenState extends State<OrderStageScreen> {
  final OrderDetailViewController orderDetailViewController =
      Get.find<OrderDetailViewController>();
  @override
  void initState() {
    orderDetailViewController.fetchOrderDetailView(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalatte.mainPageColor,
      body: Column(
        children: [
          Header(
            hasAction: false,
            icon1Url: 'assets/icons/Icon-left.svg',
            onpress1: () => Get.back(),
            title: 'Статус заказа',
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
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        ColorPalatte.strongRedColor,
                      ),
                    ),
                  );
                } else {
                  return orderDetailViewController
                          .orderDetailViewList.first.orderProducts.isNotEmpty
                      ? ListView(
                          children: [
                            Center(
                              child: Container(
                                height: 45,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: ColorPalatte.strongRedColor,
                                ),
                                child: Center(
                                  child: Text(
                                    'D ' +
                                        orderDetailViewController
                                            .orderDetailViewList.first.id
                                            .toString(),
                                    style: FontStyles.boldStyle(
                                      fontSize: 18,
                                      fontFamily: 'Product Sans',
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 38),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 11),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          .65,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .18,
                                      child:
                                          Image.asset('assets/food/lavash.png'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 35,
                                  ),
                                  Stages(
                                    bigTitle: 'Заказ принят',
                                    iconUrl: 'assets/icons/clock-alt.svg',
                                    smallTitle: orderDetailViewController
                                        .orderDetailViewList.first.date
                                        .toString(),
                                  ),
                                  orderDetailViewController.orderDetailViewList
                                                  .first.status ==
                                              1 ||
                                          orderDetailViewController
                                                  .orderDetailViewList
                                                  .first
                                                  .status ==
                                              2
                                      ? Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 5),
                                          width: 30.0,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: List.generate(
                                              4,
                                              (index) => Container(
                                                height: 8,
                                                width: 2,
                                                color: Color(0xffFB6A43),
                                                margin: EdgeInsets.only(
                                                    bottom: 2,
                                                    left: 20,
                                                    top: 2),
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container(),
                                  orderDetailViewController.orderDetailViewList
                                                  .first.status ==
                                              1 ||
                                          orderDetailViewController
                                                  .orderDetailViewList
                                                  .first
                                                  .status ==
                                              2
                                      ? Stages(
                                          bigTitle: 'В процессе',
                                          iconUrl: 'assets/icons/flag.svg',
                                          smallTitle: orderDetailViewController
                                              .orderDetailViewList.first.date
                                              .toString(),
                                        )
                                      : Container(),
                                  orderDetailViewController.orderDetailViewList
                                              .first.status ==
                                          2
                                      ? Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 5),
                                          width: 30.0,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: List.generate(
                                              4,
                                              (index) => Container(
                                                height: 8,
                                                width: 2,
                                                color: Color(0xffFB6A43),
                                                margin: EdgeInsets.only(
                                                    bottom: 2,
                                                    left: 20,
                                                    top: 2),
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container(),
                                  orderDetailViewController.orderDetailViewList
                                              .first.status ==
                                          2
                                      ? Stages(
                                          bigTitle: 'Передан на доставку',
                                          iconUrl:
                                              'assets/icons/deliver-alt.svg',
                                          smallTitle: orderDetailViewController
                                              .orderDetailViewList.first.date
                                              .toString(),
                                        )
                                      : Container(),
                                  SizedBox(
                                    height: 55,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.86,
                                    height: 63,
                                    child: RaisedButton(
                                      elevation: 0,
                                      color: Color(0xff9F111B),
                                      onPressed: () => Get.to(HomeScreen()),
                                      // onPressed: () => _showSnackBar(context),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Text(
                                        'на главную'.toUpperCase(),
                                        style: FontStyles.mediumStyle(
                                          fontSize: 20,
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                ],
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
