import 'package:HAMD/models/code_confirm_model.dart';
import 'package:HAMD/services/profile.dart';
import 'package:get/get.dart';

class UserProfileController extends GetxController {
  var profileList = List<Data>().obs;
  var isLoading = true.obs;

  void fetchProfileData() async {
    print('fetching user data');
    try {
      isLoading(true);
      var profile = await ProfileFetch.profileFetch();

      if (profile != null) {
        profileList.clear();
        profileList.add(profile.data);
        print('this is profile info');
        print(profile);
        print(profileList.first.phone);
      }
    } finally {
      isLoading(false);
    }
  }
}
