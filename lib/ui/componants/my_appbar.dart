import 'package:HAMD/ObxHelper/cart_list_controller.dart';
import 'package:HAMD/constants/colors.dart';
import 'package:HAMD/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

final CartListController cartListController = Get.find<CartListController>();
AppBar customAppBar(
  BuildContext context, {
  String icon1Url,
  final bool isCart,
  String title,
  String icon2Url,
  Function onpress1,
  Function onpress2,
  double width1,
  double height1,
  double width2,
  double height2,
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: ColorPalatte.mainPageColor,
    elevation: 0,

    flexibleSpace: Padding(
      padding: const EdgeInsets.only(top: 50, left: 26, right: 26, bottom: 10),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * .1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: IconButton(
                  icon: SvgPicture.asset(
                    icon1Url,
                    width: width1,
                    height: height1,
                  ),
                  onPressed: onpress1),
            ),
            Text(
              title,
              style: FontStyles.boldStyle(
                fontSize: 16,
                fontFamily: 'Montserrat',
                color: Color(0xff222E54),
              ),
            ),
            isCart
                ? Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Stack(
                      overflow: Overflow.visible,
                      children: [
                        IconButton(
                          icon: SvgPicture.asset(
                            icon2Url,
                            width: width2,
                            height: height2,
                          ),
                          onPressed: onpress2,
                        ),
                        Obx(
                          () => cartListController.allCartList.length == 0
                              ? Container()
                              : Positioned(
                                  top: 0,
                                  right: -5,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: ColorPalatte.strongRedColor,
                                    ),
                                    child: Center(
                                      child: Text(
                                        cartListController.allCartList.length
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                      ],
                    ))
                : Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: IconButton(
                        icon: SvgPicture.asset(
                          icon2Url,
                          width: width2,
                          height: height2,
                        ),
                        onPressed: onpress2),
                  )
          ],
        ),
      ),
    ),
    // actions: [
    //   Container(
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(15),
    //         color: Colors.white,
    //       ),
    //       child: IconButton(icon: Icon(Icons.face), onPressed: icon2press)),
    // ],
  );
}

// SvgPicture mySvg(String iconUrl, {double width = 14, double height = 14}) {
//   return SvgPicture.asset(
//     iconUrl,
//     height: height,
//     width: width,
//   );
// }
