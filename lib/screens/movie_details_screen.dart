import 'package:flutter/material.dart';
import 'package:peliculas_app_prog3/models/models.dart';

class MovieDetailsScreen extends StatelessWidget {
   
  const MovieDetailsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    // Cambiar luego por instancia de Movie;
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(movie: movie,),
          SliverList(delegate: SliverChildListDelegate([
            _PosterAndTitle(movie: movie,),
            _Overview(movie: movie,),
          ]))
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {

  final Movie movie;

  const _CustomAppBar({
    required this.movie
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 150,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.all(0),
        title: Container(
          color: Colors.black38,
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: 10, left: 20, right: 20),
          child: Text(movie.title, maxLines: 2, overflow: TextOverflow.ellipsis,)
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/no-image.jpg'), 
          image: NetworkImage('${ movie.fullPosterImg  }'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {

  final Movie movie;

  const _PosterAndTitle({
    required this.movie
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(10),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'), 
              image: NetworkImage('${ movie.fullPosterImg }'),
              height: 200,
            ),
          ),
          SizedBox(width: 20),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width - 230),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.title, 
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                ),
                Text(movie.originalTitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Icon(Icons.star_rounded),
                    SizedBox(width: 5,),
                    Text('${ movie.voteAverage.round()}/10')
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {

  final Movie movie;

  const _Overview({
    required this.movie
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(movie.overview, 
      textAlign: TextAlign.justify,
      ),
    );
  }
}