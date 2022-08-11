import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:denty/core/theme/theme.dart';
import 'package:denty/utils/constants/assets_constants.dart';
import 'package:denty/utils/constants/router_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../utils/widgets/background_container_widget.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  String role = 'Hasta';
  @override
  void initState() {
    super.initState();
    _checkRole();
  }

  void _checkRole() async {
    User? user = FirebaseAuth.instance.currentUser;
    final DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .get();

    setState(() {
      role = snap['role'];
    });

    if (role == 'Hasta') {
      Navigator.pushNamedAndRemoveUntil(
          context, homeViewRoute, (route) => false);
    } else if (role == 'Doktor') {
      Navigator.pushNamedAndRemoveUntil(
          context, adminViewRoute, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushNamed(context, onboardViewRoute);
    });
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: BackgroundContainer(
      size: size,
      backgroundImage: BackgroundConstants.blueBackground,
      child: Padding(
        padding: EdgeInsets.only(top: size.height * 0.1),
        child: Column(
          children: [
            Lottie.asset(LottieConstants.tooth),
            Text(
              AppLocalizations.of(context).denty,
              style: themeData.textTheme.headline1,
            )
          ],
        ),
      ),
    ));
  }
}
