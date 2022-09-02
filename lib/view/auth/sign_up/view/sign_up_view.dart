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
import '../viewmodel/sign_up_cubit.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => SignUpCubit(context),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return _buildScaffold(size, context);
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
                        value: context.read<SignUpCubit>().dropdownvalue,

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
                            context.read<SignUpCubit>().dropdownvalue = newValue!;
                        }),
                  )
                ],
              ),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: context.read<SignUpCubit>().formKey,
                child: Padding(
                  padding: EdgeInsets.only(
                      right: size.width * 0.05, top: size.height * 0.05),
                  child: Column(children: [
                    CustomTextFormField(
                      controller: context.read<SignUpCubit>().nameSurnameController,
                      label: AppLocalizations.of(context).nameSurname,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: size.height * 0.035),
                    CustomTextFormField(
                      controller: context.read<SignUpCubit>().ageController,
                      label: AppLocalizations.of(context).age,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: size.height * 0.035),
                    CustomTextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: context.read<SignUpCubit>().emailController,
                        label: AppLocalizations.of(context).email),
                    SizedBox(height: size.height * 0.035),
                    CustomTextFormField(
                        controller: context.read<SignUpCubit>().phoneController,
                        label: AppLocalizations.of(context).phoneNumber,
                        keyboardType: TextInputType.phone),
                    SizedBox(height: size.height * 0.035),
                    CustomPasswordTextField(
                      controller: context.read<SignUpCubit>().passwordController,
                    )
                  ]),
                ),
              ),
              SizedBox(height: size.height * 0.04),
              CustomButton(
                size: size,
                text: AppLocalizations.of(context).signUp,
                onPress: () {
                  context.read<SignUpCubit>().signUpUser();
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
