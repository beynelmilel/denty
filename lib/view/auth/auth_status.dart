import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/locator.dart';

class AuthStatus extends ChangeNotifier {
  AuthStatusEnum _statusEnum = AuthStatusEnum.unknown;
  AuthStatusEnum get statusEnum => _statusEnum;

  void initState() {
    final token = getIt<SharedPreferences>().getString('token');
    if (token != null && token.isNotEmpty) {
      _statusEnum = AuthStatusEnum.authenticated;
    } else {
      _statusEnum = AuthStatusEnum.unauthenticated;
    }
    notifyListeners();
  }
}

enum AuthStatusEnum { authenticated, unauthenticated, unknown }
