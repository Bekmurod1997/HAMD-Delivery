import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserDataItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 105,
            height: 105,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset('assets/images/user.png'),
          ),
          SizedBox(height: 12),
          Text(
            'Дмитрий',
            style: TextStyle(fontSize: 22),
          ),
          SizedBox(height: 8),
          Text('+998 93 531 0224, ID:424'),
          SizedBox(height: 44),
        ],
      ),
    );
  }
}
