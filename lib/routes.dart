import 'package:flutter/material.dart';
import 'package:funmusic/constants/route_constants.dart';
import 'package:funmusic/screens/home_screen.dart';
import 'package:funmusic/screens/splash_screen.dart';


class MyRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeRoute:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case SplashScreenRoute:
        return MaterialPageRoute(builder: (context) => SplashScreen());
    }
  }
}
