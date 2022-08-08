import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiCalls {
  static String _apiUrl = 'https://12f1-120-138-12-251.in.ngrok.io';

  // static void setApiUrl(url) {
  //   _apiUrl = url.tirm();
  // }

  static Future<dynamic> login(String userId, String password) async {
    Uri url = Uri.parse(_apiUrl + '/login');
    http.Response response = await http.post(url, body: {
      'user': userId,
      'password': password,
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      return decodedData[0];
    }
    return null;
  }

  static Future<dynamic> getAttendance(String date, String userBiometric) async {
    Uri url = Uri.parse(_apiUrl + '/attendanceOfDay?date=$date&userBiometric=$userBiometric');
    print('called $url');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      print('called decodedData' + decodedData.toString());
      return decodedData['data'];
    }
    return null;
  }

  static Future<dynamic> getProfile(String userBiometric) async {
    Uri url = Uri.parse(_apiUrl + '/profile');
    http.Response response = await http.post(url, body: {
      "userBiometric": userBiometric,
    });
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      return decodedData[0];
    }
    return null;
  }

  static Future<dynamic> forgotPunch(String empId, String attendanceDate, String inTime, String outTime, String reason, String postingDate) async {
    Uri url = Uri.parse(_apiUrl + '/punch_missing');
    http.Response response = await http.post(url, body: {
      'empid': empId,
      'att_date': attendanceDate,
      'in_time': inTime,
      'out_time': outTime,
      'reason': reason,
      'posting_date': postingDate,
      'poster_id': empId,
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      return true;
    }
    return null;
  }
}
