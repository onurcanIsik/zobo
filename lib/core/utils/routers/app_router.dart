import 'package:auto_route/auto_route.dart';
import 'package:zobo/core/utils/enums/router.enums.dart';
import 'package:zobo/core/utils/routers/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: SplashRoute.page,
      path: RouteEnums.splashPath.value,
      initial: true,
    ),
    AutoRoute(page: HomeRoute.page, path: RouteEnums.homePath.value),
    AutoRoute(page: OkeyGame101.page, path: RouteEnums.okeyPath.value),
  ];
}
