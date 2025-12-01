import 'package:flutter/material.dart';
import 'package:peliculas_app_prog3/providers/movies_provider.dart';
import 'package:peliculas_app_prog3/routes/app_routes.dart';
import 'package:peliculas_app_prog3/themes/app_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MoviesProvider(), lazy: false,
        )
      ],
      child: const MyApp(),
    );
  }
}

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
      theme: Apptheme.darkTheme
    );
  }
}