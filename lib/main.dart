import 'package:flutter/material.dart';
import 'app/app_module.dart';
import 'app/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppModule.setupDependencies();

  runApp(const AppWidget());
}