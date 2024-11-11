import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';

import 'domain/dependency_injection/injectable.dart';
import 'domain/generated/codegen_loader.g.dart';
import 'presentation/app.dart';
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();

  WidgetsBinding.instance.addPostFrameCallback((_) async {
    await EasyLocalization.ensureInitialized();
  });



  runApp(EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [
        Locale('en', 'US'), // English (United States)
        Locale('ar', 'SA'), // Arabic (Saudi Arabia)
        Locale('ml', 'IN'), // Malayalam (India)
        Locale('hi', 'IN'), // Hindi (India)
        Locale('zh', 'CN'), // Simplified Chinese (China)
      ],
      fallbackLocale: const Locale('en', 'US'),
      saveLocale: true,
      startLocale: const Locale('en', 'US'),
      assetLoader: const CodegenLoader(),
      child: const MyApp()));
}

//110207