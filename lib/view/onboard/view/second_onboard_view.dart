import 'package:denty/utils/constants/assets_constants.dart';
import 'package:denty/utils/constants/colors_constants.dart';
import 'package:denty/utils/constants/router_constants.dart';
import 'package:denty/utils/widgets/background_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SecondOnBoardView extends StatelessWidget {
  const SecondOnBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(context, thirdOnboardViewRoute, (route) => false);
        },
        elevation: 0,
        backgroundColor: ColorsConstans.accentGreen,
        label: Text('Sonraki'),
      ),
      body: BackgroundContainer(
        size: size,
        backgroundImage: BackgroundConstants.blueBackground,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Lottie.asset(LottieConstants.category),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: const Text(
                "Uygulama içerisinde arama yaparak Türkiye'nin 81 ilinde bulunan uygulamamıza kayıtlı kliniklerdeki alanlarında uzman doktorları size en uygun şekilde bulabilirsiniz",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
