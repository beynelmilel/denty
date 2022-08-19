import 'package:denty/core/theme/theme.dart';
import 'package:denty/utils/constants/router_constants.dart';
import 'package:denty/utils/show_snack_bar.dart';
import 'package:flutter/material.dart';

import '../../../../core/product/service/auth_service.dart';
import '../../../../utils/constants/assets_constants.dart';
import '../../../../utils/widgets/background_container_widget.dart';
import '../../../../utils/widgets/custom_button_widget.dart';
import '../../../../utils/widgets/custom_password_text_field.dart';
import '../../../../utils/widgets/custom_text_form_field.dart';
import '../../../../utils/widgets/register_title_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  String dropdownvalue = 'Kullanıcı';

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  Future<void> loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String response = await AuthService().loginUser(
        email: _emailController.text, password: _passwordController.text);
    if (response == "success" && dropdownvalue == 'Kullanıcı') {
      setState(() {
        _isLoading = false;
      });
      Navigator.pushNamed(context, homeViewRoute);
    }
    if (response == "success" && dropdownvalue == 'Admin') {
      setState(() {
        _isLoading = false;
      });
      Navigator.pushNamed(context, adminViewRoute);
    } else {
      setState(() {
        _isLoading = false;
      });
      showSnackBar(context, response);
    }
  }

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
                      title: AppLocalizations.of(context).signIn,
                      onPressed: () {
                        Navigator.pushNamed(context, signUpViewRoute);
                      },
                      textButtonText: '${AppLocalizations.of(context).signUp}!',
                      questionText: AppLocalizations.of(context).dontAccount,
                    ),
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
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: size.width * 0.05, top: size.height * 0.05),
                    child: Column(
                      children: [
                        CustomTextFormField(
                          controller: _emailController,
                          label: AppLocalizations.of(context).email,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: size.height * 0.035),
                        CustomPasswordTextField(
                          controller: _passwordController,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.04),
                CustomButton(
                  size: size,
                  text: AppLocalizations.of(context).signIn,
                  onPress: () {
                    loginUser();
                  },
                  color: themeData.secondaryHeaderColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
