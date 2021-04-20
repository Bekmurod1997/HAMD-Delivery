import 'package:HAMD/ObxHelper/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserInfo extends StatelessWidget {
  final UserProfileController ppController = Get.find<UserProfileController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (ppController.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (!ppController.isLoading.value &&
          ppController.profileList.isNotEmpty) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                    'http://hamd.loko.uz/' +
                        ppController.profileList.first.photo,
                  )),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      ppController.profileList.first.name ?? '',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                      '${ppController.profileList.first.phone}   ID: ${ppController.profileList.first.id}'),
                  SizedBox(height: 44),
                ],
              ),
            ],
          ),
        );
      } else {
        return Center(
          child: Text('Error'),
        );
      }
    });
  }
}
