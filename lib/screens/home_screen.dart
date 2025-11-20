import 'package:flutter/material.dart';
import 'package:peliculas_app_prog3/providers/movies_provider.dart';
import 'package:peliculas_app_prog3/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla principal'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper(movie: moviesProvider.nowPlayingMovies,),

            MovieSlider(),
          ],
        ),
      ),
    );
  }
}