import 'package:auto_route/auto_route.dart';
import 'package:feature1/feature1.dart';
import 'package:flutter_modular_architecture/src/presentation/pages/home_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: '/', page: HomePage, initial: true),
    Feature1RouterModule.route,
    RedirectRoute(path: '*', redirectTo: '/'),
  ],
)
class $AppRouter {}
