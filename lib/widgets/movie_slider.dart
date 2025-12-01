import 'package:flutter/material.dart';
import 'package:peliculas_app_prog3/models/models.dart';

class MovieSlider extends StatefulWidget {

  final List<Movie> movie;
  final Function onNextPage;
  final String widgetName;

  const MovieSlider({
    super.key, 
    required this.movie, 
    required this.onNextPage, 
    required this.widgetName,
  });

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    
    scrollController.addListener((){

      if(scrollController.position.pixels >= scrollController.position.maxScrollExtent - 500){
        print('Hemos llegado al final');
        widget.onNextPage();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
            //Titilo del w
            child: Text(widget.widgetName, style: Theme.of(context).textTheme.titleLarge )
          ),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movie.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 130,
                  height: 200,
                  // color: Colors.green,
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/details', arguments: widget.movie[index]),
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(10),
                          child: FadeInImage(
                            placeholder: AssetImage('assets/no-image.jpg'), 
                            image: NetworkImage('${ widget.movie[index].fullPosterImg }'),
                            width: 130,
                            height: 170,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(widget.movie[index].title, style: Theme.of(context).textTheme.bodyLarge, maxLines: 2, overflow: TextOverflow.ellipsis,)
                    
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}