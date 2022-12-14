import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Authentication/views/welcomepage.dart';

import '../../Authentication/views/login_screen.dart';
import '../../Authentication/views/otp_screen.dart';
import '../../Authentication/views/user_information_screen.dart';
import '../utility/error.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case WelcomePage.routeName:
      return MaterialPageRoute(
        builder: (context) => const WelcomePage(),
      );
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );
    case OTPScreen.routeName:
      final verificationId = settings.arguments as String;
      return MaterialPageRoute(
        builder: (context) => OTPScreen(
          verificationId: verificationId,
        ),
      );
    case UserInformationScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const UserInformationScreen(),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: ErrorScreen(error: 'This page doesn\'t exist'),
        ),
      );
  }
}
