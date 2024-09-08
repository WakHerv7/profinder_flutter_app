import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:profinder/shared/business_logic/cubit/application_cubit.dart';
import 'package:profinder/shared/routing/app_router.dart';
import 'package:profinder/shared/service_locator.dart';
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
      child: GlobalLoaderOverlay(
        child: MultiBlocProvider(
          providers: [
            BlocProvider<ApplicationCubit>(
              create: (context) => getIt.get<ApplicationCubit>(),
            ),
          ],
          child: MaterialApp.router(
            title: 'Pro Finder',
            theme: buildLightTheme(),
            debugShowCheckedModeBanner: false,
            darkTheme: buildLightTheme(),
            themeMode: ThemeMode.system,
            builder: (context, child) => _unFocusWrapper(child),
            routerConfig: _appRouter.config(),
          ),
        ),
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
