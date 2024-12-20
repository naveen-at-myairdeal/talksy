// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../constants/asset_paths.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.AuthScreensAssets>(() => _i3.AuthScreensAssets());
  gh.factory<_i3.BottomNavAssets>(() => _i3.BottomNavAssets());
  gh.factory<_i3.OnBoardingScreenAssets>(() => _i3.OnBoardingScreenAssets());
  gh.factory<_i3.Profile>(() => _i3.Profile());
  return get;
}
