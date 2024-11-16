import 'package:injectable/injectable.dart';
import 'package:talksy/domain/dependency_injection/injectable.dart';

abstract class Assetpaths {
  static OnBoardingScreenAssets onBoardingScreenAssets = getItLocator<OnBoardingScreenAssets>();
  static AuthScreensAssets authScreensAssets = getItLocator<AuthScreensAssets>();
  static BottomNavAssets bottomNavAssets = getItLocator<BottomNavAssets>();
  static Profile profile = getItLocator<Profile>();
}

@injectable
class OnBoardingScreenAssets {
  final String firsImage = "assets/images/onboarding/Frame 1.svg";
  final String secondImage = "assets/images/onboarding/Frame 2.svg";
  final String thirdImage = "assets/images/onboarding/Frame 3.svg";
}

@injectable
class AuthScreensAssets {
  final String signinPageBanner = "assets/images/Frame (1).svg";
  final String otpPageBanner = "assets/images/Frame (2).svg";
  final String indianFLag = "assets/images/india-flag-icon.png";
  final String usaFlag = "assets/images/united-states-flag-icon.png";
  final String spainFlag = "assets/images/spain-country-flag-icon.png";
  final String profilePlaceHolder = "assets/images/Group 154 (1).svg";
  final String cameraIconAtProfileImage = 'assets/images/Group 79 (1).svg';
}

@injectable
class BottomNavAssets {
  final String profile = "assets/images/profile.svg";
  final String chat = "assets/images/chat.svg";
  final String call = "assets/images/call.svg";
  final String contacts = "assets/images/contact.svg";
}

@injectable
class Profile {
  final String about = "assets/images/profile/about.svg";
  final String account = "assets/images/profile/account.svg";

  final String callChat = "assets/images/profile/cals chat.svg";

  final String contacts = "assets/images/profile/contacts.svg";
  final String logout = "assets/images/profile/logout.svg";
  final String notification = "assets/images/profile/notification.svg";
  final String saved = "assets/images/profile/saved.svg";
  final String terms = "assets/images/profile/terms.svg";

  final String usage = "assets/images/profile/usage.svg";
}
