import 'package:HAMD/constants/shared_preference_constatns.dart';
import 'package:get_storage/get_storage.dart';

class MyPref {
  static final prefs = GetStorage();

  static get token => prefs.read(SPKeys.token);
  static get code => prefs.read(SPKeys.code);
  static get secondToken => prefs.read(SPKeys.secondToken);
  static get phoneNumber => prefs.read(SPKeys.phoneNumber);
  static get lang => prefs.read(SPKeys.lang);

  static set token(String value) => prefs.write(SPKeys.token, value);
  static set phoneNumber(String phoneNumber) =>
      prefs.write(SPKeys.phoneNumber, phoneNumber);
  static set code(String codeValue) => prefs.write(SPKeys.code, codeValue);
  static set secondToken(String secondTokenvalue) =>
      prefs.write(SPKeys.secondToken, secondTokenvalue);
  static set lang(String lang) => prefs.write(SPKeys.lang, lang);

  static clearToken() => prefs.remove(SPKeys.token);
  static clearSecondToken() => prefs.remove(SPKeys.secondToken);
  static clearCode() => prefs.remove(SPKeys.code);
  static clearPhoneNumber() => prefs.remove(SPKeys.phoneNumber);
  static clearLang() => prefs.remove(SPKeys.lang);
}
