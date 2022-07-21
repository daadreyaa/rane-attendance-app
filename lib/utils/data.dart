import 'package:rane_mobile_app/providers/user_biometric.dart';

class Data {
  static late final _userBiometric;

  static late final _verID;

  static String get userBiometric => _userBiometric;

  static setUserBiometric(userBiometric) => _userBiometric = userBiometric;

  static String get verID => _verID;

  static setVerID(verID) => _verID = verID;
}
