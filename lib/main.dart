import 'package:flutter/material.dart';

import 'src/application/app.dart';
import 'src/application/di/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(App());
}
