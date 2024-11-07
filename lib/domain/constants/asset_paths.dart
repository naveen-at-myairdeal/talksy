import 'package:injectable/injectable.dart';
import 'package:talksy/domain/dependency_injection/injectable.dart';

abstract class Assetpaths {
  static OnBoardingScreenAssets onBoardingScreenAssets = getItLocator<OnBoardingScreenAssets>();
}

@injectable
class OnBoardingScreenAssets {
  final String firsImage = "assets/images/OBJECT.svg";
  final String secondImage = "assets/images/OBJECTS.svg";
  final String thirdImage = "assets/images/Group 137.svg";
}
