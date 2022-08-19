import 'package:denty/core/theme/theme.dart';
import 'package:denty/utils/constants/assets_constants.dart';
import 'package:denty/utils/constants/router_constants.dart';
import 'package:denty/utils/widgets/background_container_widget.dart';
import 'package:denty/utils/widgets/custom_button_widget.dart';
import 'package:denty/utils/widgets/custom_password_text_field.dart';
import 'package:denty/utils/widgets/custom_text_form_field.dart';
import 'package:denty/utils/widgets/register_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/product/service/auth_service.dart';
import '../../../../utils/show_snack_bar.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

String dropdownvalue = 'Kullanıcı';

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController _nameSurnameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _nameSurnameController.dispose();
    _ageController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
  }

  Future<void> signUpUser() async {
    setState(() {
      _isLoading = true;
    });

    String response = await AuthService().signUpUser(
        email: _emailController.text,
        password: _passwordController.text,
        nameSurname: _nameSurnameController.text,
        age: _ageController.text,
        phoneNumber: _phoneController.text,
        role: dropdownvalue);

    if (response == "success" && dropdownvalue == 'Kullanıcı') {
      setState(() {
        _isLoading = false;
      });
      Navigator.pushReplacementNamed(context, homeViewRoute);
    } else if (response == "success" && dropdownvalue == 'Admin') {
      setState(() {
        _isLoading = false;
      });
      Navigator.pushReplacementNamed(context, adminViewRoute);
    } else {
      setState(() {
        _isLoading = false;
      });
      showSnackBar(context, response);
    }
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: BackgroundContainer(
          backgroundImage: BackgroundConstants.whiteBackground,
          size: size,
          child: Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.05, top: size.height * 0.08),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RegisterTitle(
                        title: AppLocalizations.of(context).createAccount,
                        questionText:
                            AppLocalizations.of(context).alreadyAccount,
                        onPressed: () {
                          Navigator.pushNamed(context, signInViewRoute);
                        },
                        textButtonText:
                            '${AppLocalizations.of(context).signIn}!'),
                    Padding(
                      padding: EdgeInsets.only(right: size.width * 0.09),
                      child: DropdownButton(
                          style: TextStyle(color: themeData.primaryColor),

                          // Initial Value
                          value: dropdownvalue,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: ['Admin', 'Kullanıcı'].map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          }),
                    )
                  ],
                ),
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: size.width * 0.05, top: size.height * 0.05),
                    child: Column(children: [
                      CustomTextFormField(
                        controller: _nameSurnameController,
                        label: AppLocalizations.of(context).nameSurname,
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(height: size.height * 0.035),
                      CustomTextFormField(
                        controller: _ageController,
                        label: AppLocalizations.of(context).age,
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: size.height * 0.035),
                      CustomTextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          label: AppLocalizations.of(context).email),
                      SizedBox(height: size.height * 0.035),
                      CustomTextFormField(
                          controller: _phoneController,
                          label: AppLocalizations.of(context).phoneNumber,
                          keyboardType: TextInputType.phone),
                      SizedBox(height: size.height * 0.035),
                      CustomPasswordTextField(
                        controller: _passwordController,
                      )
                    ]),
                  ),
                ),
                SizedBox(height: size.height * 0.04),
                CustomButton(
                  size: size,
                  text: AppLocalizations.of(context).signUp,
                  onPress: () {
                    signUpUser();
                  },
                  color: themeData.secondaryHeaderColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
