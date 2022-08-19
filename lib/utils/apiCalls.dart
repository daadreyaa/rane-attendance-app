import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rane_mobile_app/screens/on_duty_screen.dart';



class ApiCalls {
  
  static String _apiUrl = 'https://quick-walls-doubt-49-249-229-42.loca.lt';

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

  static Future<dynamic> getAttendance(
      String date, String userBiometric) async {
    Uri url = Uri.parse(
        _apiUrl + '/attendanceOfDay?date=$date&userBiometric=$userBiometric');
    print('called $url');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      print('called decodedData' + decodedData.toString());
      return decodedData['data'];
    }
    return null;
  }

  static Future<dynamic> Attendance(String date, String emp_id) async {
    Uri url = Uri.parse(_apiUrl + '/attendance?emp_id=$emp_id&date=$date');
    print('called $url');
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      print('called decodedData: ' + decodedData.toString());
      
      return decodedData;
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

  // static Future<dynamic> OnDuty(String userBiometric) async {
  //   Uri url = Uri.parse(_apiUrl + '/');
  //   http.Response response = await http.post(url, body: {
  //     "userBiometric": userBiometric,
  //   });
  //   if (response.statusCode == 200) {
  //     var decodedData = jsonDecode(response.body);
  //     return decodedData[0];
  //   }
  //   return null;
  // }

  static Future<dynamic> forgotPunch(String empId, String attendanceDate,
      String inTime, String outTime, String reason, String postingDate) async {
    Uri url = Uri.parse(_apiUrl + '/forgot_punch');
    http.Response response = await http.post(url, body: {
      'emp_id': empId,
      'date': attendanceDate,
      'actual_in_time': inTime,
      'sactual_out_time': outTime,
      'reason': reason,
      // 'posting_date': postingDate,
      'poster_id': empId,
    });
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      print(decodedData);

      return true;
    }
    return null;
  }

  static Future<dynamic> shiftChange(
    String empId,
    String start_date,
    String end_date,
    String current_shift,
    String posting_dt,
    String poster_id,
  ) async {
    Uri url = Uri.parse(_apiUrl + '/shift_change');
    http.Response response = await http.post(url, body: {
      'emp_id': empId,
      'shift_start_date': start_date,
      'shift_end_date': end_date,
      'emp_shift': current_shift,
      'posting_dt': posting_dt,
      'poster_id': poster_id,
      // 'preffered_shift': preffered_shift,
      // 'reliever_available': reliever_available,
      // 'reliever_name': reliever_name,
    });
    print(response.statusCode);

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      print(decodedData);
      return true;
    }
    return null;
  }
}
