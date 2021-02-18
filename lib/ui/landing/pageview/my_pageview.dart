import 'dart:ui';

import 'package:HAMD/constants/colors.dart';
import 'package:HAMD/constants/fontSize.dart';
import 'package:HAMD/constants/fonts.dart';
import 'package:HAMD/ui/auth/auth_screen.dart';
import 'package:HAMD/ui/landing/pageview/widgets/pageview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class MyPageView extends StatefulWidget {
  @override
  _MyPageViewState createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  int currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage('assets/images/slider.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            color: Colors.black.withOpacity(0.2),
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                Spacer(flex: 1),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: SvgPicture.asset(
                      'assets/icons/hamd-logo.svg',
                    ),
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
                Expanded(
                  flex: 4,
                  child: PageView(
                    controller: _pageController,
                    physics: ClampingScrollPhysics(),
                    onPageChanged: (int page) {
                      setState(() {
                        currentPage = page;
                      });
                    },
                    children: [
                      PageViewItem(
                        mytitle:
                            'ЗАКАЖИ СВОЙ ЛЮБИМЫЙ  ЛАВАШ В HAMD ЗА ПАРУ КЛИКОВ!',
                      ),
                      PageViewItem(mytitle: 'ОТСЛЕЖИВАЙТЕ ВАШИ ЗАКАЗЫ ОНЛАЙН!'),
                      PageViewItem(
                        mytitle: 'ПРИКРЕПЛЯЙТЕ ВАШУ КАРТУ И ПЛАТИТЕ ОНЛАЙН',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: List.generate(
                      3,
                      (index) => buildDots(index: index),
                    ),
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 54,
                        width: screenSize.width * 0.8,
                        child: RaisedButton(
                          elevation: 0,
                          color: ColorPalatte.nextButtonColor,
                          onPressed: () => currentPage == 2
                              ? Get.to(AuthScreen())
                              : _pageController.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            currentPage == 2
                                ? 'ПЕРЕЙТИ К РЕГИСТРАЦИИ'
                                : 'ДАЛЕЕ',
                            style: FontStyles.boldStyle(
                                fontSize: 16,
                                fontFamily: 'Ubuntu',
                                color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      currentPage == 2
                          ? Container()
                          : TextButton(
                              onPressed: () => _pageController.animateToPage(
                                    2,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  ),
                              child: Text(
                                'Пропустить' ?? '',
                                style: FontStyles.boldStyle(
                                    fontSize: 16,
                                    fontFamily: 'Ubuntu',
                                    color: Colors.white),
                              ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildDots({int index}) {
    int curPage = currentPage;
    return Container(
      margin: EdgeInsets.only(right: 5),
      width: curPage == index ? 20 : 7.0,
      height: 7,
      decoration: BoxDecoration(
        borderRadius: curPage == index
            ? BorderRadius.circular(6.0)
            : BorderRadius.circular(10.0),
        color: curPage == index ? Colors.red : Colors.white,
      ),
    );
  }
}
