import 'package:HAMD/constants/colors.dart';
import 'package:HAMD/constants/fonts.dart';
import 'package:HAMD/ui/home/widgets/food_card.dart';
import 'package:flutter/material.dart';

class CategoryButtons extends StatefulWidget {
  @override
  _CategoryButtonsState createState() => _CategoryButtonsState();
}

class _CategoryButtonsState extends State<CategoryButtons> {
  int buttonIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Наше меню',
              style: FontStyles.mediumStyle(
                fontSize: 18,
                fontFamily: 'Poppins', //looked really strange with this style
                color: Color(0xff222E54),
              ),
            ),
          ),
        ),
        SizedBox(height: 25),
        Container(
          height: 50,
          width: double.infinity,
          child: ListView.separated(
            itemCount: 8,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: index == 0
                  ? EdgeInsets.only(left: 25)
                  : EdgeInsets.only(left: 13),
              child: RaisedButton(
                elevation: 0,
                color: buttonIndex == index
                    ? ColorPalatte.strongRedColor
                    : Colors.white,
                onPressed: () {
                  print(index);
                  setState(() {
                    buttonIndex = index;
                  });
                  print('*********');
                  print(buttonIndex);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  'ЛАВАШ',
                  style: FontStyles.mediumStyle(
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    color:
                        buttonIndex == index ? Colors.white : Color(0xff222E54),
                  ),
                ),
              ),
            ),
            separatorBuilder: (context, index) => SizedBox(width: 0),
          ),
        ),
      ],
    );
  }
}
