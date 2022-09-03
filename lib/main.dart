<<<<<<< HEAD
import 'package:denty/view/auth/sign_in/view/sign_in_view.dart';
import 'package:denty/view/doctors/detail/appointment/appointment_view.dart';
import 'package:denty/view/user/home/view/home_view.dart';
=======
>>>>>>> 7799cfd785c56b751454cc01a3baf169473d80c8
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'core/provider/user_provider.dart';
import 'core/routes/route.dart';
import 'core/theme/theme.dart';
import 'firebase_options.dart';
import 'utils/constants/router_constants.dart';
import 'view/doctors/add_doctor/add_doctors_view.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: themeData,
        onGenerateRoute: Routes.generateRoute,
        // initialRoute: splashViewRoute,
        // title: 'Denty',
        home: AppointmentView(),
      ),
    );
  }
}