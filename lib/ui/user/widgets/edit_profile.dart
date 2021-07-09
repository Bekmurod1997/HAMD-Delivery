import 'dart:io';

import 'package:HAMD/ObxHelper/profile_controller.dart';
import 'package:HAMD/constants/api.dart';
import 'package:HAMD/constants/colors.dart';
import 'package:HAMD/constants/fonts.dart';
import 'package:HAMD/ui/auth/auth_screen.dart';
import 'package:HAMD/ui/componants/header.dart';
import 'package:HAMD/ui/landing/landing_screen.dart';
import 'package:HAMD/ui/masks/mask_format.dart';
import 'package:HAMD/utils/my_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart' as g;
import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final UserProfileController usrController =
      g.Get.find<UserProfileController>();
  File _userImage;
  final userImagePicker = ImagePicker();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  Dio dio = Dio();
  Future getUserImage() async {
    final pickedUserImage =
        await userImagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedUserImage != null) {
        _userImage = File(pickedUserImage.path);
      } else {
        print('No Image Selected');
      }
    });
  }

  @override
  void initState() {
    nameController..text = usrController.profileList.first.name;
    phoneController..text = usrController.profileList.first.phone.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('photo url');
    print(usrController.profileList.first.photo);
    // final UserProfileController ppController =
    //     Get.find<UserProfileController>();
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: constraints.maxWidth,
                  minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Header(
                        icon1Url: 'assets/icons/Icon-left.svg',
                        onpress1: () => g.Get.back(),
                        title: 'profileTitle'.tr,
                        icon2Url: 'assets/icons/logout.svg',
                        onpress2: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text('exiting'.tr),
                                  actions: [
                                    FlatButton(
                                      onPressed: () => g.Get.back(),
                                      child: Text('no'.tr),
                                    ),
                                    FlatButton(
                                      child: Text('yes'.tr),
                                      onPressed: () {
                                        MyPref.clearToken();
                                        MyPref.clearSecondToken();
                                        MyPref.clearPhoneNumber();
                                        MyPref.clearLang();
                                        print('toke after exiting');
                                        print(MyPref.token);
                                        print('second toke after exiting');
                                        print(MyPref.secondToken);
                                        print('phone number after existing');
                                        print(MyPref.phoneNumber);
                                        g.Get.offAll(LandingScreen());
                                      },
                                    ),
                                  ],
                                );
                              });
                        },
                        height2: 18,
                        width2: 18,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 15, right: 15, top: 33, bottom: 45),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Stack(
                                      overflow: Overflow.visible,
                                      children: [
                                        Container(
                                            height: 95,
                                            width: 95,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: _userImage == null
                                                ? CircleAvatar(
                                                    backgroundColor:
                                                        Colors.white,
                                                    backgroundImage: NetworkImage(
                                                        'http://hamd.loko.uz/' +
                                                            usrController
                                                                .profileList
                                                                .first
                                                                .photo),
                                                    // SvgPicture.asset(
                                                    //     'assets/icons/avatar.svg'),
                                                  )
                                                : CircleAvatar(
                                                    radius: 60,
                                                    backgroundImage:
                                                        FileImage(_userImage),
                                                  )),
                                        Positioned(
                                          right: 25,
                                          bottom: -10,
                                          child: Container(
                                            width: 36,
                                            height: 36,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                            ),
                                            child: Center(
                                              child: IconButton(
                                                  padding: EdgeInsets.zero,
                                                  icon: Icon(
                                                    Icons.add,
                                                    color: Color(0xff575F6B),
                                                    size: 25,
                                                  ),
                                                  onPressed: getUserImage),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'name'.tr,
                                        style: FontStyles.regularStyle(
                                          fontSize: 14,
                                          fontFamily: 'Montserrat',
                                          color: Color(0xff232323),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: nameController,
                                        keyboardType: TextInputType.name,
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.only(left: 0.0),
                                          hintText: 'hintName'.tr,
                                          hintStyle: FontStyles.regularStyle(
                                              fontSize: 17,
                                              fontFamily: 'Ubuntu',
                                              color: Color(0xff232323)),
                                          border: InputBorder.none,
                                        ),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      Divider(
                                        thickness: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 35),
                            Text(
                              'yourNumber'.tr,
                              style: FontStyles.regularStyle(
                                fontSize: 15,
                                fontFamily: 'Montserrat',
                                color: Color(0xffAAAEB7),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              decoration: BoxDecoration(
                                  color: const Color(0xffFFFFFF),
                                  borderRadius: BorderRadius.circular(15)),
                              height: 55.0,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Icon(
                                      Icons.phone_android,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Flexible(
                                    child: TextFormField(
                                      enabled: false,
                                      controller: phoneController,
                                      inputFormatters: [
                                        InputMask.maskPhoneNumber
                                      ],
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.only(left: 15.0),
                                        hintText: 'enterYourNumber'.tr,
                                        hintStyle: FontStyles.regularStyle(
                                            fontSize: 12,
                                            fontFamily: 'Ubuntu',
                                            color: Color(0xff9E9E9E)),
                                        border: InputBorder.none,
                                      ),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, bottom: 40),
                          child: Align(
                            alignment: FractionalOffset.bottomCenter,
                            child: Container(
                              height: 54,
                              width: double.infinity,
                              child: RaisedButton(
                                elevation: 0,
                                color: ColorPalatte.strongRedColor,
                                onPressed: () async {
                                  FormData formData = FormData.fromMap({
                                    'name': nameController.text,
                                    'phone': phoneController.text,
                                  });

                                  if (_userImage != null) {
                                    String fileName =
                                        _userImage.path.split('/').last;
                                    formData.files.addAll([
                                      MapEntry(
                                        "photo",
                                        await MultipartFile.fromFile(
                                          _userImage.path,
                                          filename: fileName,
                                        ),
                                      ),
                                    ]);
                                  }

                                  final token = MyPref.secondToken;
                                  var response = await dio.post(
                                    ApiUrl.updateProfile,
                                    data: formData,
                                    options: Options(
                                      headers: {
                                        HttpHeaders.authorizationHeader:
                                            'Bearer $token'
                                      },
                                    ),
                                    // body: {
                                    //   'name': nameController.text,
                                    //   'phone': phoneController.text,
                                    // },
                                  );
                                  if (response.statusCode == 200) {
                                    print('okayy');
                                    g.Get.snackbar(null, null,
                                        messageText: Text(
                                          'yourDateSaved'.tr,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        backgroundColor: Color(0xff007E33));
                                    usrController.fetchProfileData();
                                  }
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                child: Text(
                                  'saveChanges'.tr,
                                  style: FontStyles.boldStyle(
                                      fontSize: 16,
                                      fontFamily: 'Ubuntu',
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
