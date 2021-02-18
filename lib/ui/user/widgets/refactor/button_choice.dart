import 'package:HAMD/constants/fonts.dart';
import 'package:flutter/material.dart';

class ButtonChoice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SizedBox(
              height: 44,
              child: RaisedButton(
                elevation: 0,
                color: selectedIndex == 0
                    ? Colors.red.shade200
                    : Colors.transparent,
                onPressed: () {
                  if (selectedIndex == 1) {
                    setState(() {
                      selectedIndex = 0;
                    });
                  }
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                child: Text(
                  'Мои заказы',
                  style: FontStyles.boldStyle(
                      fontSize: 15,
                      fontFamily: 'Montserrat',
                      color: Colors.black),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Expanded(
            child: SizedBox(
              height: 44,
              child: RaisedButton(
                elevation: 0,
                color: selectedIndex == 1
                    ? Colors.red.shade200
                    : Colors.transparent,
                onPressed: () {
                  if (selectedIndex == 0) {
                    setState(() {
                      selectedIndex = 1;
                    });
                  }
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                child: Text(
                  'Методы оплат',
                  style: FontStyles.boldStyle(
                      fontSize: 15,
                      fontFamily: 'Montserrat',
                      color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
