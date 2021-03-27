import 'package:HAMD/ObxHelper/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDataItem extends StatelessWidget {
  final UserProfileController ppController = Get.find<UserProfileController>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(() {
        if (ppController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (!ppController.isLoading.value &&
            ppController.profileList.isNotEmpty) {
          return Column(
            children: [
              CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    'http://hamd.loko.uz/' +
                        ppController.profileList.first.photo,
                  )),
              SizedBox(height: 12),
              Text(
                ppController.profileList.first.name ?? '',
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(height: 8),
              Text(
                  '${ppController.profileList.first.phone}   ID: ${ppController.profileList.first.id}'),
              SizedBox(height: 44),
            ],
          );
        } else {
          return Center(
            child: Text('Error'),
          );
        }
      }),
    );
  }
}
