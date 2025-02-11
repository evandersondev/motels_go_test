import 'package:flutter/material.dart';

import './app/app_widget.dart';
import './app/config/inject.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Inject.init();

  runApp(const AppWidget());
}
