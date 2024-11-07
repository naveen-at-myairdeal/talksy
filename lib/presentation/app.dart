
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talksy/domain/routes/routes.dart';

import '../domain/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     WidgetsBinding.instance.addPostFrameCallback((_)async {
     await  EasyLocalization.ensureInitialized();

    });
    return ScreenUtilInit(
       designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
      builder: (context,child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Talksy',
          theme: AppTheme.themeData,
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          initialRoute: RoutePaths.onBoardingScreen,
          onGenerateRoute: AppRouter.generateRoute,
        );
      }
    );
  }
}
