import 'package:denty/core/model/user_model.dart';
import 'package:denty/core/product/service/auth_service.dart';
import 'package:flutter/widgets.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;
  final AuthService _authMethods = AuthService();

  UserModel get getUser => _user!;

  Future<void> refreshUser() async {
    UserModel user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}