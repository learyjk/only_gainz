import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:only_gainz/models/models.dart';
import 'package:only_gainz/screens/home/home_screen.dart';
import 'package:only_gainz/screens/onboarding/onboarding_screen.dart';
import 'package:only_gainz/screens/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('This is route: ${settings.name}');

    switch (settings.name) {
      case HomeScreen.routeName:
        return HomeScreen.route();
      case UsersScreen.routeName:
        return UsersScreen.route(user: settings.arguments as User);
      case OnboardingScreen.routeName:
        return OnboardingScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('Error - No such route'),
        ),
      ),
    );
  }
}
