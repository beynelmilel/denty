import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/theme/theme.dart';
import '../../../../utils/constants/assets_constants.dart';
import '../../../../utils/constants/router_constants.dart';
import '../../../../utils/widgets/background_container_widget.dart';
import '../../../../utils/widgets/custom_button_widget.dart';
import '../../../../utils/widgets/custom_password_text_field.dart';
import '../../../../utils/widgets/custom_text_form_field.dart';
import '../../../../utils/widgets/register_title_widget.dart';
import '../viewmodel/sign_in_cubit.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => SignInCubit(context),
      child: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return _buildScaffold(size,context);
        },
      ),
    );
  }

  Scaffold _buildScaffold(Size size, BuildContext context) {
    return Scaffold(
    body: SingleChildScrollView(
      child: BackgroundContainer(
        backgroundImage: BackgroundConstants.whiteBackground,
        size: size,
        child: Padding(
          padding: EdgeInsets.only(
              left: size.width * 0.05, top: size.height * 0.08),
          child: Expanded(
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
                          value: context.read<SignInCubit>().dropdownvalue,
                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),
                          // Array list of items
                          items: ['Admin', 'Kullanıcı'].map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                              context.read<SignInCubit>().dropdownvalue = newValue!;
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
                          controller: context.read<SignInCubit>().emailController,
                          label: AppLocalizations.of(context).email,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: size.height * 0.035),
                        CustomPasswordTextField(
                          controller: context.read<SignInCubit>().passwordController,
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
                    context.read<SignInCubit>().loginUser();
                  },
                  color: themeData.secondaryHeaderColor,
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
  }
}
