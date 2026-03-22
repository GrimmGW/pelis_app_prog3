import 'package:flutter/material.dart';
import 'package:peliculas_app_prog3/providers/movies_provider.dart';
import 'package:peliculas_app_prog3/routes/app_routes.dart';
import 'package:peliculas_app_prog3/themes/app_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

//crear provider, proveedor de la API y demás info.
//incluso crearemos el multiprovider para ya acostumbrarnos a que nos puede llegar una o mas APIs

//Cuando nosotros trabajamos con el provider de manera default, es decir, por defecto como vemos aca, es creador de manera perezosa
//Hasta que algun componente o algun widget, va a verificar si la instancia ya esta creada y la retorna, y en dado caso no este
//entonces lo va a crear y para eso nos sirve lazy que, por defecto esta en true, y hasta que se necesite se crea la instancia
//y al pasarlo a false, tan pronto como exista el widget entonces va a mandar a llamar su inicializacion
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
      //probar theme con colorScheme:
        // theme: ThemeData(
        // colorScheme: .fromSeed(seedColor: Colors.deepPurple),
    );
  }
}