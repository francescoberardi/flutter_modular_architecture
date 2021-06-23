import 'package:auto_route/auto_route.dart';

import '../presentation/pages/feature1_page.dart';

class Feature1RouterModule {
  static const route = AutoRoute(
    path: '/feature1',
    page: Feature1Page,
  );
}
