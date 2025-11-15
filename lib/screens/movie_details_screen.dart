import 'package:flutter/material.dart';

class MovieDetailsScreen extends StatelessWidget {
   
  const MovieDetailsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    //Cambiar luego por instancia de Movie;
    // final String movie = ModalRoute.of(context)!.settings.arguments.toString();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(delegate: SliverChildListDelegate([
            _PosterAndTitle(),
            _Overview(),
            _Overview(),
            _Overview(),
            _Overview(),
            _Overview(),
            _Overview(),
          ]))
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {

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
          child: Text('movie.details', maxLines: 2, overflow: TextOverflow.ellipsis,)
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/no-image.jpg'), 
          image: NetworkImage('https://placehold.co/400x200/png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(10),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'), 
              image: NetworkImage('https://placehold.co/200x300/png'),
              height: 200,
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Titulo de la peli', 
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              ),
              Text('Titulo original',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  Icon(Icons.star_rounded),
                  SizedBox(width: 5,),
                  Text('4.8')
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text('Dolor ipsum incididunt ex culpa. Laborum reprehenderit reprehenderit reprehenderit pariatur laboris esse ea commodo pariatur. Laboris occaecat aliquip laborum do veniam. Quis culpa amet dolore et consectetur nulla irure do dolore et consectetur non amet Lorem.', 
      textAlign: TextAlign.justify,
      ),
    );
  }
}