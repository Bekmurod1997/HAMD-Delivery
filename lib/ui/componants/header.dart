import 'package:HAMD/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatelessWidget {
  final String icon1Url;
  final String title;
  final String icon2Url;
  final Function onpress1;
  final Function onpress2;
  final double width1;
  final double height1;
  final double width2;
  final double height2;

  Header({
    this.icon1Url,
    this.onpress1,
    this.title,
    this.icon2Url,
    this.onpress2,
    this.height1,
    this.width1,
    this.height2,
    this.width2,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 26, right: 26, bottom: 10),
      child: Container(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: IconButton(
                  icon: mySvg(icon1Url, width: width1, height: height1),
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
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: IconButton(
                  icon: mySvg(icon2Url, width: width1, height: height2),
                  onPressed: onpress2),
            ),
          ],
        ),
      ),
    );
  }

  SvgPicture mySvg(String iconUrl, {double width = 14, double height = 14}) {
    return SvgPicture.asset(
      iconUrl,
      height: height,
      width: width,
    );
  }
}
