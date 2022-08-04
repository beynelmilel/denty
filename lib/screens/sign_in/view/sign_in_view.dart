import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:denty/core/product/auth_service.dart';
import 'package:denty/core/theme/theme.dart';
import 'package:denty/utils/constants/router_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/assets_constants.dart';
import '../../../utils/widgets/background_container_widget.dart';
import '../../../utils/widgets/custom_button_widget.dart';
import '../../../utils/widgets/custom_password_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../utils/widgets/custom_text_form_field.dart';
import '../../../utils/widgets/register_title_widget.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: BackgroundContainer(
          backgroundImage: ImageConstants.whiteBackground,
          size: size,
          child: Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.05, top: size.height * 0.08),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RegisterTitle(
                  title: AppLocalizations.of(context).signIn,
                  onPressed: () {
                    Navigator.pushNamed(context, signUpViewRoute);
                  },
                  textButtonText: '${AppLocalizations.of(context).signUp}!',
                  questionText: AppLocalizations.of(context).dontAccount,
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
                    String email = _emailController.text.trim();
                    String password = _passwordController.text.trim();

                    if (email.isEmpty) {
                      print('Email is empty');
                    } else if (password.isEmpty) {
                      print('Password is empty');
                    } else {
                      context.read<AuthService>().login(email, password);
                      print('işlem başarılı huhuhuhu');
                    }
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
