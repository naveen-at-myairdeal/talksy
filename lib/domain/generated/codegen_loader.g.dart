// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> zh_CN = {};
static const Map<String,dynamic> ar_SA = {};
static const Map<String,dynamic> ml_IN = {};
static const Map<String,dynamic> en_US = {
  "one": {
    "second": "second"
  },
  "hello": "naveenllll"
};
static const Map<String,dynamic> hi_IN = {};
static const Map<String, Map<String,dynamic>> mapLocales = {"zh_CN": zh_CN, "ar_SA": ar_SA, "ml_IN": ml_IN, "en_US": en_US, "hi_IN": hi_IN};
}
