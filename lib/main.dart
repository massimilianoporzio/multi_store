import 'package:flutter/material.dart';

import 'app.dart';
import 'core/services/service_locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}
