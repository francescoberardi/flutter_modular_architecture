import 'package:auto_route/auto_route.dart';

import '../presentation/pages/cubit_page.dart';

class CubitRouterModule {
  static const route = AutoRoute(
    path: '/feature_cubit',
    page: CubitPage,
  );
}
