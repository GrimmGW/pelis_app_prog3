import 'package:flutter/material.dart';
import 'package:peliculas_app_prog3/routes/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peliculas App',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
      //temas usando copyWith
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarThemeData(
          backgroundColor: Colors.deepPurpleAccent
        )
      )
    );
  }
}