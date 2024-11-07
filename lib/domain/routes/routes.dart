import 'package:flutter/material.dart';
import 'package:talksy/presentation/onboarding_screen/onboarding_screen.dart';

import '../../presentation/auth/enter_phone_number.dart';

abstract class RoutePaths {
  static const String onBoardingScreen = '/onboarding_screen';
  static const String signInPage = '/signinPage';
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case RoutePaths.signInPage:
        return MaterialPageRoute(builder: (_) =>  SignInPage());

      default:
        return MaterialPageRoute(
          builder: (_) => const Text(
            'Replace with page not found',
          ),
        );
    }
  }
}
