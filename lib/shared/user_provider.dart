import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  String _role = '';
  bool _isLoggedIn = false;

  String get role => _role;
  bool get isLoggedIn => _isLoggedIn;

  void login(String role) {
    _role = role;
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    _role = '';
    _isLoggedIn = false;
    notifyListeners();
  }
}
