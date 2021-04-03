import 'package:HAMD/ObxHelper/counterState.dart';
import 'package:HAMD/ObxHelper/favoritte.dart';
import 'package:HAMD/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemPosition extends StatelessWidget {
  final CounterClass counterState = Get.find<CounterClass>();

  final FavoriteState favoriteState = Get.put(FavoriteState());

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -20.0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Container(
          width: MediaQuery.of(context).size.width * .8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 129.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Color(0xff9F111B),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: IconButton(
                        onPressed: () {
                          counterState.decrement();
                        },
                        icon: Icon(
                          Icons.remove,
                          size: 16,
                        ),
                        color: Color(0xff9F111B),
                      ),
                    ),
                    Obx(
                      () => Text(
                        counterState.count.value.toString(),
                        style: FontStyles.mediumStyle(
                          fontSize: 24,
                          fontFamily: 'Poppins',
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: IconButton(
                        onPressed: () {
                          counterState.inrcement();
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
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child: Obx(
                    () => IconButton(
                        icon: Icon(Icons.favorite),
                        color: favoriteState.favorite.value
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
    );
  }
}
