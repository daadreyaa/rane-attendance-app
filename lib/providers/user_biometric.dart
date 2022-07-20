import 'package:flutter/material.dart';

class UserBiometric with ChangeNotifier {
  late String _userBiometric;

  String get userBiometric => _userBiometric;

  void updateUserBiometric(String userBiometric) {
    _userBiometric = userBiometric;
    print('called');
    notifyListeners();
  }
}
