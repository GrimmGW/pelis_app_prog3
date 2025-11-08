import 'package:flutter/material.dart';
import 'package:peliculas_app_prog3/screens/screens.dart';

class AppRoutes {

  static String initialRoute = '/home';

  static Map<String, Widget Function(BuildContext)> routes = {

    '/home' : (BuildContext context) => const HomeScreen()

  };


}