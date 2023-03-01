import 'package:amazon_clone/presentation/auth/views/auth_view.dart';
import 'package:amazon_clone/presentation/resources/routes_manager.dart';
import 'package:amazon_clone/presentation/resources/theme_manager.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {

  // Named Constractor
  MyApp._internal();

  int appState = 0;


  // singleton or single instance
  static final MyApp _instance = MyApp._internal();

  // factory "Constructor with return value"
  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getApplicationTheme(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.authRoute,
    );
  }
}
