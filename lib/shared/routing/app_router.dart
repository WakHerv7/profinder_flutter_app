import 'package:auto_route/auto_route.dart';
import 'package:profinder/shared/routing/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AppInitRoute.page, initial: true),
        AutoRoute(
          page: LoginRoute.page,
        ),
        AutoRoute(
          page: ApplicationRoute.page,
        ),
        AutoRoute(
          page: RegisterRoute.page,
        ),
      ];
}
