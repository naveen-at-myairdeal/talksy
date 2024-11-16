import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talksy/domain/constants/app_strings.dart';
import 'package:talksy/domain/constants/asset_paths.dart';
import 'package:talksy/domain/routes/routes.dart';
import 'package:talksy/domain/theme/app_theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  static List<String> imageAssetPaths = [Assetpaths.onBoardingScreenAssets.firsImage, Assetpaths.onBoardingScreenAssets.secondImage, Assetpaths.onBoardingScreenAssets.thirdImage];

  static const List<String> middleHeadStrings = [AppStrings.onboarding_screen_one_middle_head, AppStrings.onboarding_screen_two_middle_head, AppStrings.onboarding_screen_three_middle_head];

  static const List<String> bodytexts = [AppStrings.oneboarding_screen_one_body_label, AppStrings.oneboarding_screen_two_body_label, AppStrings.oneboarding_screen_three_body_label];

  final List<Widget> images = List.generate(
    imageAssetPaths.length,
    (index) => Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: SvgPicture.asset(
        imageAssetPaths[index],
        fit: BoxFit.fitHeight,
      ),
    ),
  );

  final ValueNotifier<int> currentIndex = ValueNotifier(0);
  final PageController pageController = PageController();

  void _onPageChanged(int index) {
    currentIndex.value = index;
  }

  void _handleNextPage() {
    if (currentIndex.value < images.length - 1) {
      pageController.nextPage(
        duration: Durations.short1,
        curve: Curves.easeInOut,
      );
    }else{
       Navigator.of(context).pushNamed(RoutePaths.signInPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 47.h,
                    width: double.infinity,
                  ),
                  SizedBox(
                    height: 45.h,
                    child: Text(
                      AppStrings.onboarding_screen_one_title,
                      style: AppTheme.displayLargePrimaryColor,
                    ),
                  ),
                  SizedBox(height: 83.h),
                  SizedBox(
                    // width: 325.w,
                    height: 480.h,
                    child: PageView.builder(
                      controller: pageController,
                      onPageChanged: _onPageChanged,
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return ValueListenableBuilder(
                          valueListenable: currentIndex,
                          builder: (context, int value, _) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: 270.h,
                                  width: double.infinity,
                                  child: images[value],
                                ),
                                SizedBox(height: 80.h),
                                Text(
                                  middleHeadStrings[value],
                                  
                                  style: AppTheme.displayMediumPrimaryColor,
                                ),
                                SizedBox(height: 14.h),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 1),
                                  child: Text(
                                    bodytexts[value],
                                    style: AppTheme.bodySmallGreyColor,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Pagination indicators
            Positioned(
              bottom: 150.h,
              left: 0,
              right: 0,
              child: ValueListenableBuilder<int>(
                valueListenable: currentIndex,
                builder: (context, value, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      images.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.5),
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: value == index ? AppTheme.primaryColor : AppTheme.textColorSecondary,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 18.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 32.w),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(RoutePaths.signInPage);
                },
                child: const Text(AppStrings.onboarding_screen_skip),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 17.w),
              child: ElevatedButton(
                onPressed: _handleNextPage,
                child: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
