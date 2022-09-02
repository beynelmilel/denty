import 'package:denty/core/theme/theme.dart';
import 'package:denty/utils/constants/assets_constants.dart';
import 'package:denty/utils/constants/colors_constants.dart';
import 'package:denty/utils/constants/router_constants.dart';
import 'package:denty/utils/widgets/background_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../utils/widgets/custom_button_widget.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: BackgroundContainer(
          size: size,
          backgroundImage: BackgroundConstants.blueBackground,
          child: Container(
            margin: EdgeInsets.only(top: size.height * 0.3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context).denty,
                  style: themeData.textTheme.headline1,
                ),
                Column(
                  children: [
                    CustomButton(
                      size: size,
                      color: ColorsConstans.accentGreen,
                      text: AppLocalizations.of(context).signIn,
                      onPress: () {
                        Navigator.pushNamedAndRemoveUntil(context, signInViewRoute, (route) => false);
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    CustomButton(
                      size: size,
                      text: AppLocalizations.of(context).signUp,
                      color: ColorsConstans.transparent,
                      borderColor: Colors.white,
                      onPress: () {
                        Navigator.pushNamedAndRemoveUntil(context, signUpViewRoute, (route) => false);
                      },
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
