import 'package:HAMD/ui/user/widgets/my_orders.dart';
import 'package:flutter/material.dart';

class OrderChoice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20, left: 20, top: 20),
      height: 500,
      child: MyOrders(),
    );
  }
}
