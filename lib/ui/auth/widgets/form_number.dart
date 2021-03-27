import 'package:HAMD/constants/colors.dart';

import 'package:HAMD/constants/fonts.dart';
import 'package:HAMD/services/sign_in.dart';
import 'package:HAMD/ui/masks/mask_format.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormNumber extends StatefulWidget {
  @override
  _FormNumberState createState() => _FormNumberState();
}

class _FormNumberState extends State<FormNumber> {
  TextEditingController smsController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void validateAndSave() async {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      print('Form is valid');

      Get.dialog(
        Scaffold(
          backgroundColor: Colors.black.withOpacity(.1),
          body: Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              color: Colors.white,
              width: double.infinity,
              height: 100.0,
              child: Row(
                children: [
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        ColorPalatte.strongRedColor),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'пожалуйста, подождите',
                    style: FontStyles.lightStyle(
                      fontSize: 19,
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      // showDialog(
      //     context: context,
      //     barrierDismissible: false,
      //     builder: (context) {
      //       return Dialog(
      //         child: new Row(
      //           mainAxisSize: MainAxisSize.min,
      //           children: [
      //             new CircularProgressIndicator(
      //               valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
      //             ),
      //           ],
      //         ),
      //       );
      //     });

      SignIn.signInUser(userNumber: smsController.text);

      //   var response = await http.post(ApiUrl.signIn, body: {
      //     'phone': smsController.text,
      //     'role': '3',
      //   });
      //   if (response.statusCode == 200) {
      //     var body = SignUpModel.fromJson(json.decode(response.body));
      //     print(response.body);
      //     print('bu yearda toke');
      //     print(body.data.token);
      //     print('bu yearda code');
      //     print(body.data.code.code);

      //     MyPref.token = body.data.token;
      //     MyPref.code = body.data.code.code;
      //   }
      // } else {
      // print('Form is invalid');
    } else {
      print('Form is invalid');
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                    Icons.call,
                    color: Colors.grey,
                  ),
                ),
                Flexible(
                  child: TextFormField(
                    inputFormatters: [InputMask.maskPhoneNumber],
                    controller: smsController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "+998",
                      contentPadding: const EdgeInsets.only(left: 15.0),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Value can not be empty";
                      } else if (value.length < 17) {
                        return 'Value can not be less than 13';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 54,
            width: screenSize.width * 0.8,
            child: RaisedButton(
              elevation: 0,
              color: ColorPalatte.strongRedColor,
              onPressed: validateAndSave,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Text(
                'Отправить код',
                style: FontStyles.boldStyle(
                    fontSize: 16, fontFamily: 'Ubuntu', color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
