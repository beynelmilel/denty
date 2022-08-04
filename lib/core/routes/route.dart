
import 'package:denty/screens/home/admin/view/admin_view.dart';
import 'package:flutter/material.dart';

import '../../screens/home/user/view/home_view.dart';
import '../../screens/onboard/view/onboard_view.dart';
import '../../screens/sign_in/view/sign_in_view.dart';
import '../../screens/sign_up/view/sign_up_view.dart';
import '../../screens/splash/view/splash.view.dart';
import '../../utils/constants/router_constants.dart';
class Routes {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name){
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