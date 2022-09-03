import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/product/service/auth_service.dart';
import '../../../../utils/constants/router_constants.dart';
import '../../../../utils/show_snack_bar.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.context) : super(SignUpInitial());

  final TextEditingController nameSurnameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;
  String dropdownvalue = 'Kullanıcı';
  BuildContext context;

  Future<void> signUpUser() async {
    _isLoading = true;

    String response = await AuthService().signUpUser(
        email: emailController.text,
        password: passwordController.text,
        nameSurname: nameSurnameController.text,
        age: ageController.text,
        phoneNumber: phoneController.text,
        role: dropdownvalue);

    if (response == "success" && dropdownvalue == 'Kullanıcı') {
      _isLoading = false;

      Navigator.pushReplacementNamed(context, homeViewRoute);
    } else if (response == "success" && dropdownvalue == 'Admin') {
      _isLoading = false;

      Navigator.pushReplacementNamed(context, adminViewRoute);
    } else {
      _isLoading = false;

      showSnackBar(context, response);
    }
  }

  final formKey = GlobalKey<FormState>();
}

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}
