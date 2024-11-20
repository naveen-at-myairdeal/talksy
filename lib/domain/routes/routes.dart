import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talksy/presentation/chat/chat_screen.dart';
import 'package:talksy/presentation/home/home_screen.dart';
import 'package:talksy/presentation/onboarding_screen/onboarding_screen.dart';

import '../../application/auth/otp_bloc/otp_bloc.dart';
import '../../presentation/auth/enter_otp_screen.dart';
import '../../presentation/auth/enter_phone_number.dart';
import '../../presentation/auth/get_user_name_and_profile_pic_screen.dart';
import '../../presentation/auth/select_language_screen.dart';
import '../../presentation/call/new_call_contact_list_screen.dart';
import '../../presentation/chat/add_new_members_screen.dart';
import '../../presentation/profile/profile_screen.dart';

abstract class RoutePaths {
  static const String onBoardingScreen = '/onboarding_screen';
  static const String signInPage = '/signinPage';
  static const String enterOtpPage = '/enterOtpPage';
  static const String languageSelectionScreen = '/languageSelectionScreen';
  static const String getUserNameAndProfilePicture = '/getUserNameAndProfilePicture';
  static const String newCallScreenContactList = '/newCallScreenContactList';
  static const String homeScreen = '/homeScreen';
  static const String profile = '/profile';
  static const String addNewMembers = '/addNewMembers';
  static const String chatScreen = '/chatScreen';
}

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
                    phoneNumber: args,
                  ),
                ));
      case RoutePaths.languageSelectionScreen:
        return MaterialPageRoute(builder: (_) => LanguageSelectionScreen());
      case RoutePaths.getUserNameAndProfilePicture:
        return MaterialPageRoute(builder: (_) => GetUserNameAndProfilePicture());
      case RoutePaths.newCallScreenContactList:
        return MaterialPageRoute(builder: (_) => ContactsPage());
      case RoutePaths.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case RoutePaths.profile:
        return MaterialPageRoute(builder: (_) => ProfilePage());

      case RoutePaths.addNewMembers:
        return MaterialPageRoute(builder: (_) => AddMembersScreen());
      case RoutePaths.chatScreen:
        return MaterialPageRoute(builder: (_) => ChatScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const Text(
            'Replace with page not found',
          ),
        );
    }
  }
}
