import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talksy/presentation/onboarding_screen/onboarding_screen.dart';

import '../../application/auth/otp_bloc/otp_bloc.dart';
import '../../presentation/auth/enter_otp_screen.dart';
import '../../presentation/auth/enter_phone_number.dart';
import '../../presentation/auth/get_user_name_and_profile_pic_screen.dart';
import '../../presentation/auth/select_language_screen.dart';

abstract class RoutePaths {
  static const String onBoardingScreen = '/onboarding_screen';
  static const String signInPage = '/signinPage';
  static const String enterOtpPage = '/enterOtpPage';
  static const String languageSelectionScreen = '/languageSelectionScreen';
  static const String getUserNameAndProfilePicture = '/getUserNameAndProfilePicture';
}

//GetUserNameAndProfilePicture
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case RoutePaths.signInPage:
        return MaterialPageRoute(builder: (_) => SignInPage());

      case RoutePaths.enterOtpPage:
        final args = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => OtpBloc(),
                  child: OTPInputScreen(
                    phoneNumber: "9855668686",
                  ),
                ));
      case RoutePaths.languageSelectionScreen:
        return MaterialPageRoute(builder: (_) => LanguageSelectionScreen());
      case RoutePaths.getUserNameAndProfilePicture:
        return MaterialPageRoute(builder: (_) => GetUserNameAndProfilePicture());

      default:
        return MaterialPageRoute(
          builder: (_) => const Text(
            'Replace with page not found',
          ),
        );
    }
  }
}
