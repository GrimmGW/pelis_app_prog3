import 'package:flutter/material.dart';
import 'package:peliculas_app_prog3/providers/movies_provider.dart';
import 'package:peliculas_app_prog3/search/search_delegate.dart';
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
        actions: [
          IconButton(
            onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate()), 
            icon: Icon(Icons.search_rounded)
          )
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper(movie: moviesProvider.nowPlayingMovies,),

            MovieSlider(
              movie: moviesProvider.popularMovies,
              onNextPage: () => moviesProvider.getPopularMovies(),
              widgetName: 'Peliculas populares',
            ),
            MovieSlider(
              movie: moviesProvider.popularMovies,
              onNextPage: () => moviesProvider.getPopularMovies(),
              widgetName: 'Peliculas de Comedia',
            ),
          ],
        ),
      ),
    );
  }
}