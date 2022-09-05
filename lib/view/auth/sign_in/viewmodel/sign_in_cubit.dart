// ignore_for_file: use_build_context_synchronously

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/product/service/auth_service.dart';
import '../../../../utils/constants/router_constants.dart';
import '../../../../utils/show_snack_bar.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.context) : super(SignInInitial());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;
  BuildContext context;

  String dropdownvalue = 'Admin';

  Future<void> loginUser() async {
    _isLoading = true;
    String response = await AuthService().loginUser(
        email: emailController.text, password: passwordController.text);
    if (response == "success" && dropdownvalue == 'Kullanıcı') {
      _isLoading = false;
      Navigator.pushNamedAndRemoveUntil(
          context, homeViewRoute, (route) => false);
    }
    if (response == "success" && dropdownvalue == 'Admin') {
      _isLoading = false;

      Navigator.pushNamedAndRemoveUntil(
          context, adminViewRoute, (route) => false);
    } else {
      _isLoading = false;
      showSnackBar(context, response);
    }
  }

  void dropdownChange(String newValue) {
    dropdownvalue = newValue;
  }
}

abstract class SignInState {}

class SignInInitial extends SignInState {}
