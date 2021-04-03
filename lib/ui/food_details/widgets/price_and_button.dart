import 'package:HAMD/ObxHelper/counterState.dart';
import 'package:HAMD/constants/fonts.dart';
import 'package:HAMD/services/add_cart_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PriceAndButton extends StatefulWidget {
  final String price;
  final int id;
  PriceAndButton({@required this.id, @required this.price});

  @override
  _PriceAndButtonState createState() => _PriceAndButtonState();
}

class _PriceAndButtonState extends State<PriceAndButton> {
  bool ordering = false;

  final CounterClass counterClass = Get.find<CounterClass>();
  @override
  Widget build(BuildContext context) {
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
                '${widget.price} сум',
                style: FontStyles.regularStyle(
                  fontSize: 26,
                  fontFamily: 'Poppins',
                  color: Color(0xff222E54),
                ),
              ),
            ],
          ),
          GestureDetector(
              child: Obx(() => Align(
                    alignment: Alignment.topRight,
                    child: counterClass.loading.value
                        ? CircularProgressIndicator()
                        : SvgPicture.asset(
                            'assets/icons/plus.svg',
                            width: 50,
                            height: 50,
                          ),
                  )),
              onTap: () {
                counterClass.onFetching();

                int amount = counterClass.count.value;

                print('adding to car id:');
                print(widget.id);
                print('amount');
                print(amount);

                AddCartPostService.addCartPostService(
                    amount: amount, productId: widget.id);
                // Get.to(CartScreen());
              }),
        ],
      ),
    );
  }
}
