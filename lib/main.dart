import 'package:flutter/material.dart';
import 'package:only_gainz/config/app_router.dart';
import 'package:only_gainz/config/theme.dart';
import 'screens/screens.dart';
import 'config/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Only Gainz',
      theme: theme(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: HomeScreen.routeName,
      home: HomeScreen(),
    );
  }
}
