part of 'routes_imports.dart';

@AutoRouterConfig(replaceInRouteName: "Route")
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => RouteType.adaptive();
  @override
  List<AutoRoute> get routes => [
        // routes go here
        AutoRoute(page: LandingPageRoute.page, path: "/"),
        AutoRoute(page: MyUserListRoute.page),
        AutoRoute(page: AddUserRoute.page),
        AutoRoute(page: MyPageViewRoute.page),
        AutoRoute(page: RiskNoRoute.page),
        AutoRoute(page: RiskYesRoute.page),
        AutoRoute(page: ToDataBaseRoute.page),
        AutoRoute(page: SameUserRoute.page),
        AutoRoute(page: SnewDataRoute.page),
        AutoRoute(page: GetDataRoute.page),
      ];
}
