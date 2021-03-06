import 'package:HAMD/ObxHelper/list_of_orders.dart';
import 'package:HAMD/constants/colors.dart';
import 'package:HAMD/constants/fonts.dart';

import 'package:HAMD/ui/user/widgets/refactor/order_stage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MyOrders extends StatefulWidget {
  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  final ListOfAllOrdersControllers listOfAllOrdersControllers =
      Get.find<ListOfAllOrdersControllers>();
  @override
  void initState() {
    // listOfAllOrdersControllers.fetchListOfOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (listOfAllOrdersControllers.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              ColorPalatte.strongRedColor,
            ),
          ),
        );
      } else {
        return listOfAllOrdersControllers.orderList.length > 0
            ? ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    // height: 125,
                    width: MediaQuery.of(context).size.width * 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                    ),
                    child: InkWell(
                      onTap: () => Get.to(
                          OrderStageScreen(
                            id: listOfAllOrdersControllers.orderList[index].id,
                          ),
                          // OrderDetailScreen(
                          //   id: listOfAllOrdersControllers.orderList[index].id,
                          // ),
                          arguments:
                              listOfAllOrdersControllers.orderList[index].id),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.only(top: 12, left: 15),
                              child: Column(
                                children: [
                                  Text(
                                    'order'.tr +
                                        listOfAllOrdersControllers
                                            .orderList[index].id
                                            .toString(),
                                    style: FontStyles.regularStyle(
                                      fontSize: 18,
                                      fontFamily: 'Montserrat',
                                      color: Color(0xff222E54),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    listOfAllOrdersControllers
                                            .orderList[index].productTotalSum
                                            .toString() +
                                        ' ' +
                                        'sum'.tr,
                                    style: FontStyles.boldStyle(
                                        fontSize: 20,
                                        fontFamily: 'Poppins',
                                        color: Color(0xff222E54)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Stack(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.only(top: 20, right: 15),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            listOfAllOrdersControllers
                                                .orderList[index].date
                                                .toString(),
                                            textAlign: TextAlign.right,
                                            style: FontStyles.regularStyle(
                                              fontSize: 12,
                                              fontFamily: 'Montserrat',
                                              color: Color(0xff414141),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 18,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Text(
                                            '5.0',
                                            style: FontStyles.boldStyle(
                                                fontSize: 20,
                                                fontFamily: 'Poppins',
                                                color: Color(0xff222E54)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 60,
                                    left: 90,
                                    child: SvgPicture.asset(
                                      'assets/icons/star.svg',
                                      width: 24,
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  height: 20,
                ),
                itemCount: listOfAllOrdersControllers.orderList.length,
              )
            : Text(
                'youHaveNotOrdersYet'.tr,
                textAlign: TextAlign.center,
              );
      }
    });
  }
}
