// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:profinder/app_init_screen.dart' as _i1;
import 'package:profinder/application_screen.dart' as _i2;
import 'package:profinder/authentication/presentation/screens/login_screen.dart'
    as _i3;
import 'package:profinder/authentication/presentation/screens/register_screen.dart'
    as _i4;

/// generated route for
/// [_i1.AppInitScreen]
class AppInitRoute extends _i5.PageRouteInfo<void> {
  const AppInitRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AppInitRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppInitRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.AppInitScreen();
    },
  );
}

/// generated route for
/// [_i2.ApplicationScreen]
class ApplicationRoute extends _i5.PageRouteInfo<void> {
  const ApplicationRoute({List<_i5.PageRouteInfo>? children})
      : super(
          ApplicationRoute.name,
          initialChildren: children,
        );

  static const String name = 'ApplicationRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.ApplicationScreen();
    },
  );
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute({List<_i5.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.LoginScreen();
    },
  );
}

/// generated route for
/// [_i4.RegisterScreen]
class RegisterRoute extends _i5.PageRouteInfo<void> {
  const RegisterRoute({List<_i5.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.RegisterScreen();
    },
  );
}
