import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talksy/application/auth/otp_bloc/otp_bloc.dart';
import 'package:talksy/domain/routes/routes.dart';
import 'package:talksy/presentation/home/home_screen.dart';

import '../domain/theme/app_theme.dart';
import 'auth/enter_otp_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await EasyLocalization.ensureInitialized();
    });
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
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
        });
  }
}
