import 'package:denty/utils/constants/router_constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/constants/assets_constants.dart';
import '../../../utils/constants/colors_constants.dart';
import '../../../utils/widgets/background_container_widget.dart';

class FirstOnBoardView extends StatelessWidget {
  const FirstOnBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, secondOnboardViewRoute);
        },
        elevation: 0,
        backgroundColor: ColorsConstans.accentGreen,
        label: const Text('Sonraki'),
      ),
      body: BackgroundContainer(
        backgroundImage: BackgroundConstants.blueBackground,
        size: size,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Lottie.asset(LottieConstants.tooth),
            Column(
              children: [
                const Text(
                  'denty',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                const Text('Diş hekimliği randevu uygulaması',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
