import 'package:rane_mobile_app/providers/user_biometric.dart';

class Data {
  static String _userBiometric = '';

  static late String _verID;

  static late String _empId;

  static String get userBiometric => _userBiometric;

  static setUserBiometric(userBiometric) => _userBiometric = userBiometric;

  static String get verID => _verID;

  static setVerID(verID) => _verID = verID;

  static void setEmpId(empId) => _empId = empId;

  static String getEmpId() => _empId;
}
