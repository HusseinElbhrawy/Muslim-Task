import 'package:flutter/material.dart';
import 'package:muslim_task/app/injector.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(const MyApp());
}
