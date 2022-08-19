import 'package:denty/utils/constants/assets_constants.dart';
import 'package:denty/utils/constants/colors_constants.dart';
import 'package:denty/utils/constants/router_constants.dart';
import 'package:denty/utils/widgets/background_container_widget.dart';
import 'package:denty/utils/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ThirdOnBoardView extends StatelessWidget {
  const ThirdOnBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: BackgroundContainer(
        size: size,
        backgroundImage: BackgroundConstants.blueBackground,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Lottie.asset(LottieConstants.login),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: const Text(
                'Üye olurken veya giriş yaparken admin veya kullanıcı olduğunuzu seçmeyi unutmayınız!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            CustomButton(
              size: size,
              text: 'Hadi Başlayalım',
              onPress: () {
                Navigator.pushNamed(context, onboardViewRoute);
              },
              color: ColorsConstans.accentGreen,
            )
          ],
        ),
      ),
    );
  }
}
