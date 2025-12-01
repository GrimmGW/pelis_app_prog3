import 'package:flutter/material.dart';
import 'package:peliculas_app_prog3/models/models.dart';
import 'package:peliculas_app_prog3/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {

  final int movieId;

  const CastingCards({
    super.key, 
    required this.movieId
  });

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;

    return FutureBuilder(
      future: moviesProvider.getMovieCast(movieId),
      builder: (BuildContext context, AsyncSnapshot<List<Cast>> snapshot) {

        if(!snapshot.hasData){
          return Container(
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.25),
            height: 200,
            child: CircularProgressIndicator(),
          );
        }

        final List<Cast> cast = snapshot.data!;

        return Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          height: 200,
          width: double.infinity,
          // color: Colors.red,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 180,
                width: 110,
                // color: Colors.green,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: FadeInImage(
                        placeholder: AssetImage('assets/no-image.jpg'), 
                        image: NetworkImage('${ cast[index].fullCastImg }'),
                        height: 140,
                        width: 110,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text('${cast[index].name}', style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}