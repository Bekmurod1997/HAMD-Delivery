import 'package:HAMD/constants/fonts.dart';
import 'package:HAMD/constants/colors.dart';

import 'package:flutter/material.dart';

AppBar customAppBar(BuildContext context,
    {String title,
    Function onpress1,
    double width1,
    double height1,
    Widget icon}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: ColorPalatte.mainPageColor,
    elevation: 0,
    flexibleSpace: Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: icon != null
                      ? icon
                      : IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                            size: 26,
                          ),
                          onPressed: onpress1),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: FontStyles.boldStyle(
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                ),
              ),
            ),
            Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    ),
  );
}
