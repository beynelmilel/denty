import 'package:denty/view/doctors/view/category_doctors_view.dart';
import 'package:denty/view/onboard/view/first_onboard_view.dart';
import 'package:denty/view/onboard/view/second_onboard_view.dart';
import 'package:denty/view/onboard/view/third_onboard_view.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/router_constants.dart';
import '../../view/admin/home/view/admin_view.dart';
import '../../view/auth/sign_in/view/sign_in_view.dart';
import '../../view/auth/sign_up/view/sign_up_view.dart';
import '../../view/doctors/view/doctors_view.dart';
import '../../view/onboard/view/onboard_view.dart';
import '../../view/splash/view/splash.view.dart';
import '../../view/user/home/view/home_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splashViewRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case onboardViewRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardView());
      case signUpViewRoute:
        return MaterialPageRoute(builder: (_) => const SignUpView());
      case signInViewRoute:
        return MaterialPageRoute(builder: (_) => const SignInView());
      case homeViewRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case adminViewRoute:
        return MaterialPageRoute(builder: (_) => const AdminView());
      case firstOnboardViewRoute:
        return MaterialPageRoute(builder: (_) => const FirstOnBoardView());
      case secondOnboardViewRoute:
        return MaterialPageRoute(builder: (_) => const SecondOnBoardView());
      case thirdOnboardViewRoute:
        return MaterialPageRoute(builder: (_) => const ThirdOnBoardView());
      case doctorViewRoute:
        return MaterialPageRoute(builder: (_) => const DoctorsView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('${routeSettings.name} is not a route'),
            ),
          ),
        );
    }
  }
}
