import 'package:flutter/material.dart';
import 'package:talksy/presentation/onboarding_screen/onboarding_screen.dart';

abstract class RoutePaths {
  static const String onBoardingScreen = '/onboarding_screen';
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const Text(
            'Replace with page not found',
          ),
        );
    }
  }
}
