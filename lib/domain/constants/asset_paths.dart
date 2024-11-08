import 'package:injectable/injectable.dart';
import 'package:talksy/domain/dependency_injection/injectable.dart';

abstract class Assetpaths {
  static OnBoardingScreenAssets onBoardingScreenAssets = getItLocator<OnBoardingScreenAssets>();
  static AuthScreensAssets authScreensAssets = getItLocator<AuthScreensAssets>();
}

@injectable
class OnBoardingScreenAssets {
  final String firsImage = "assets/images/OBJECT.svg";
  final String secondImage = "assets/images/OBJECTS.svg";
  final String thirdImage = "assets/images/Group 137.svg";
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
