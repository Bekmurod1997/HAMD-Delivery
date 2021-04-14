import 'package:HAMD/ObxHelper/list_of_orders.dart';
import 'package:HAMD/constants/fonts.dart';

import 'package:HAMD/ui/user/widgets/order_detail_screen.dart';
import 'package:HAMD/ui/user/widgets/refactor/order_stage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MyOrders extends StatelessWidget {
  final ListOfAllOrdersControllers listOfAllOrdersControllers =
      Get.find<ListOfAllOrdersControllers>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (listOfAllOrdersControllers.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return ListView.separated(
          itemBuilder: (context, index) => Container(
            height: 110,
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
                  arguments: listOfAllOrdersControllers.orderList[index].id),
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
                            'Заказ D ' +
                                listOfAllOrdersControllers.orderList[index].id
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
                                ' сум',
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
                            padding: EdgeInsets.only(top: 20, right: 15),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.end,
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
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    '4.5',
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
          ),
          separatorBuilder: (context, index) => SizedBox(
            height: 20,
          ),
          itemCount: listOfAllOrdersControllers.orderList.length,
        );
      }
    });
  }
}
