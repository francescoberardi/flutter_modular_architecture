import 'package:auto_route/auto_route.dart';

import '../presentation/pages/feature1_page.dart';

/// Class that expose the navigation routes for the module
class Feature1RouterModule {
  /// Navigation route property
  static const route = AutoRoute(
    path: '/feature1',
    page: Feature1Page,
  );
}
