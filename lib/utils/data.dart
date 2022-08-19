class Data {
  static String _userBiometric = '';

  static late String _verID;

  static late String _empId;

  static late String _date;

  static String get userBiometric => _userBiometric;

  static setUserBiometric(userBiometric) => _userBiometric = userBiometric;

  static String get verID => _verID;

  static setVerID(verID) => _verID = verID;

  static void setEmpId(empId) => _empId = empId;

  static String getEmpId() => _empId;

  static void setDate(date) => _date = date;

  static String getDate() => _date;
}
