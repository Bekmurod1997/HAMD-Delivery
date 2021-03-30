import 'package:HAMD/ObxHelper/add_cart_controller.dart';
import 'package:HAMD/constants/fonts.dart';
import 'package:HAMD/ui/cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PriceAndButton extends StatelessWidget {
  final String price;
  final int id;
  PriceAndButton({@required this.id, @required this.price});

  @override
  Widget build(BuildContext context) {
    var present = false;
    final AddCartController addCartController = Get.find<AddCartController>();
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                '${price} сум',
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
                child: SvgPicture.asset(
                  'assets/icons/plus.svg',
                  width: 50,
                  height: 50,
                ),
              ),
              onTap: () {
                print('pressed item id');
                print(id);

                print('adding to car id:');
                // addCartController.fetchAddCartData(id);

                if (!addCartController.addCardList.isNotEmpty) {
                  print('list pustoy');
                  addCartController.fetchAddCartData(id);
                } else {
                  for (var i = 0;
                      i < addCartController.addCardList.length;
                      i++) {
                    if (id == addCartController.addCardList[i].id) {
                      present = true;
                      print('present value is ');
                      print(present);
                      break;
                    }
                  }
                  if (present) {
                    print('item is already in card');
                  } else {
                    print('vtory else robotayet');
                    addCartController.fetchAddCartData(id);
                  }
                }

                // if (addCartController.addCardList[id].i null) {
                //   addCartController.fetchAddCartData(id);
                // } else {
                //   print('error in adding cart in price and button screen');
                // }
                print('************');
                print(addCartController.addCardList[0].name);

                // Get.to(CartScreen());
              }),
        ],
      ),
    );
  }
}
