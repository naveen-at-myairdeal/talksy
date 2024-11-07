import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talksy/domain/constants/app_strings.dart';
import 'package:talksy/domain/constants/asset_paths.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../domain/theme/app_theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

List<String> imageAssetPaths = [Assetpaths.onBoardingScreenAssets.firsImage, Assetpaths.onBoardingScreenAssets.secondImage, Assetpaths.onBoardingScreenAssets.thirdImage];
List<String> middleHeadStrings = [AppStrings.onboarding_screen_one_middle_head, AppStrings.onboarding_screen_two_middle_head, AppStrings.onboarding_screen_three_middle_head];
List<String> bodytexts = [AppStrings.oneboarding_screen_one_body_label,AppStrings.oneboarding_screen_two_body_label,AppStrings.oneboarding_screen_three_body_label];

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<Widget> images = List.generate(imageAssetPaths.length, (int indedx) {
    return SvgPicture.asset(
      imageAssetPaths[indedx],
    );
  });
  ValueNotifier<PageController> pageController = ValueNotifier(PageController());
  ValueNotifier<double> currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        children: [
          OutlinedButton(onPressed: (){}, child: Text("Skip"))
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: 47.h,
            ),
            SizedBox(
              height: 45.h,
              child: Text(
                AppStrings.onboarding_screen_one_title,
                style: AppTheme.displayLargePrimaryColor,
              ),
            ),
            SizedBox(
              height: 83.h,
            ),
            SizedBox(
                width: 290.w,
                height: 269.h,
                child: PageView.builder(
                  controller: pageController.value,
                  onPageChanged: (value) {
                    currentIndex.value = value.toDouble();
                  },
                  itemCount: images.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return images[index];
                  },
                )),
            SizedBox(
              height: 28.h,
            ),
            Row(
              children: [
                const Spacer(),
                SizedBox(
                  height: 15,
                  width: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          ValueListenableBuilder<double>(
                              valueListenable: currentIndex,
                              builder: (context, v, c) {
                                return Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: v == index.toDouble() ? AppTheme.primaryColor : AppTheme.textColorSecondary,
                                    shape: BoxShape.circle,
                                  ),
                                );
                              }),
                          const SizedBox(
                            width: 5,
                          )
                        ],
                      );
                    },
                  ),
                ),
                const Spacer(),
              ],
            ),
            Container(
              // color: Colors.red,
              height: 131.h,

              child: PageView.builder(
                  controller: pageController.value,
                  itemCount: images.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ValueListenableBuilder(
                      valueListenable: currentIndex,
                      builder: (context,v,c) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 18.h,
                            ),
                            Text(
                              middleHeadStrings[v.toInt()],
                              style: AppTheme.displayMediumPrimaryColor,
                            ),
                            SizedBox(
                              height: 14.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15,right: 15),
                              child: Text(
                                bodytexts[v.toInt()],
                                style: AppTheme.bodySmallGreyCOlor,textAlign:TextAlign.center,
                              ),
                            ),
              
                          ],
                        );
                      }
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
