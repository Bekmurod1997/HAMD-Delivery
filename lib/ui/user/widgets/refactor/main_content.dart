import 'package:HAMD/ui/user/widgets/refactor/button_choice.dart';
import 'package:HAMD/ui/user/widgets/user_data_item.dart';
import 'package:flutter/material.dart';

import 'card_choice.dart';
import 'order_choice.dart';

class MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          UserDataItem(),
          ButtonChoice(),
          selectedIndex == 0 ? OrderChoice() : CardChoice(),
        ],
      ),
    );
  }
}
