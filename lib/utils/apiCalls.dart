import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiCalls {
  static String _apiUrl = 'https://c830-2401-4900-1cd4-731e-fd94-2e1c-8537-d92d.in.ngrok.io';

  static void setApiUrl(url) {
    _apiUrl = url;
  }

  static Future<dynamic> login(String userId, String password) async {
    Uri url = Uri.parse(_apiUrl + '/login');
    http.Response response = await http.post(url, body: {
      'user': userId,
      'password': password,
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      return decodedData['data'];
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
    Uri url = Uri.parse(_apiUrl + '/profile?userBiometric=$userBiometric');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      return decodedData['data'];
    }
    return null;
  }
}
