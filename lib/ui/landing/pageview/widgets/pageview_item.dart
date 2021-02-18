// import 'package:HAMD/constants/colors.dart';
// import 'package:HAMD/constants/fontSize.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class PageViewItem extends StatefulWidget {
//   final String mytitle;
//   final int curPage;

//   final String buttonText;
//   final String mySecondButtonText;
//   //final PageController mycontroller;
//   PageViewItem({
//     this.mytitle,
//     this.curPage,
//     this.buttonText,
//     this.mySecondButtonText,

//     ///this.mycontroller,
//   });

//   @override
//   _PageViewItemState createState() => _PageViewItemState();
// }

// class _PageViewItemState extends State<PageViewItem> {
//   @override
//   Widget build(BuildContext context) {
//     PageController controller;
//     var screenSize = MediaQuery.of(context).size;
//     return Stack(
//       children: <Widget>[
//         Positioned(
//           left: screenSize.width * 0.2,
//           right: screenSize.width * 0.2,
//           top: screenSize.height * 0.13,
//           child: Container(
//             width: screenSize.width * 0.5,
//             child: SvgPicture.asset(
//               'assets/icons/hamd-logo.svg',
//             ),
//           ),
//         ),
//         Positioned(
//             left: screenSize.width * 0.05,
//             right: screenSize.width * 0.05,
//             top: screenSize.height * 0.4,
//             child: Text(
//               widget.mytitle,
//               style: TextStyle(fontSize: 35, color: Colors.white),
//             )),
//         Positioned(
//             // left: screenSize.width * 0.85,
//             right: screenSize.width * 0.05,
//             top: screenSize.height * 0.68,
//             child: Row(
//               children: List.generate(
//                 3,
//                 (index) => buildDots(index: index),
//               ),
//             )),
//         Positioned(
//           left: screenSize.width * 0.1,
//           right: screenSize.width * 0.1,
//           bottom: screenSize.height * 0.05,
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 54,
//                 width: screenSize.width * 0.8,
//                 child: RaisedButton(
//                   elevation: 0,
//                   color: ColorPalatte.nextButtonColor,
//                   onPressed:(){},
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15)),
//                   child: Text(
//                     widget.buttonText,
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: FontPalatte.nextButtonSize),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               TextButton(
//                   onPressed: () {},
//                   child: Text(
//                     widget.mySecondButtonText ?? '',
//                     style: TextStyle(fontSize: 16, color: Colors.white),
//                   ))
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Container buildDots({int index}) {
//     int curPage = widget.curPage;
//     return Container(
//       margin: EdgeInsets.only(right: 5),
//       width: curPage == index ? 20 : 7.0,
//       height: 7,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: curPage == index ? Colors.red : Colors.white,
//       ),
//     );
//   }
// }

import 'package:HAMD/constants/fonts.dart';
import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  final String mytitle;

  PageViewItem({
    this.mytitle,
  });

  Widget build(BuildContext context) {
    return Text(mytitle, style: FontStyles.boldStyle(fontSize: 33, fontFamily: 'Ubuntu', color: Colors.white) );
  }
}
