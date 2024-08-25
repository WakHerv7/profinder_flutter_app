import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profinder/shared/routing/app_router.dart';
import 'package:profinder/shared/theme/light_theme.dart';

class Application extends StatelessWidget {
  Application({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        title: 'Pro Finder',
        theme: buildLightTheme(),
        debugShowCheckedModeBanner: false,
        darkTheme: buildLightTheme(),
        themeMode: ThemeMode.system,
        builder: (context, child) => _unFocusWrapper(child),
        routerConfig: _appRouter.config(),
      ),
    );
  }
}

Widget _unFocusWrapper(Widget? child) {
  return GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
    child: child,
  );
}
