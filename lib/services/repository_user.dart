import 'package:flutter/cupertino.dart';
import 'package:HAMD/provider/user_info_provider.dart';
import 'package:provider/provider.dart';

class UserRepository {
  Future<void> fetchUserInfo(BuildContext context) async {
    UserInfoProvider userInfoProvider = Provider.of(context, listen: false);
    await userInfoProvider.fetchAllData();
  }
}
