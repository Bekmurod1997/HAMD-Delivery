import 'package:HAMD/constants/colors.dart';
import 'package:HAMD/constants/fonts.dart';
import 'package:HAMD/services/code_confirm.dart';
import 'package:HAMD/ui/home/home_screen.dart';
import 'package:HAMD/utils/my_prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormSms extends StatefulWidget {
  @override
  _FormSmsState createState() => _FormSmsState();
}

class _FormSmsState extends State<FormSms> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController codeController = TextEditingController();
  void validateAndSave() async {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      // showDialog(
      //   context: context,
      //   barrierDismissible: false,
      //   builder: (context) {
      //     return Dialog(
      //       child: new Row(
      //         mainAxisSize: MainAxisSize.min,
      //         children: [
      //           new CircularProgressIndicator(),
      //           new Text("Loading"),
      //         ],
      //       ),
      //     );
      //   },
      // );

      if (codeController.text == MyPref.code) {
        ConfirmCode.codeConfirmFunction(code: codeController.text);
        Get.offAll(HomeScreen());
      } else {
        print('hatolik');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
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
                      controller: codeController,
                      // autofocus: true,
                      keyboardType: TextInputType.number,

                      //inputFormatters: [FilteringTextInputFormatter.digitsOnly],

                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 15.0),
                        hintText: 'Введите полученный код',
                        hintStyle: FontStyles.regularStyle(
                          fontSize: 12,
                          fontFamily: 'Ubuntu',
                          color: Color(0xff9E9E9E),
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Value can not be empty";
                        } else if (value.length < 6) {
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
                onPressed: () => validateAndSave(),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  'Войти в приложение',
                  style: FontStyles.boldStyle(
                      fontSize: 16, fontFamily: 'Ubuntu', color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
