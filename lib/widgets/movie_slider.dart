import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {

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
            child: Text("Peliculas populares", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 130,
                  height: 200,
                  // color: Colors.green,
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/details', arguments: 'movie-instance'),
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(10),
                          child: FadeInImage(
                            placeholder: AssetImage('assets/no-image.jpg'), 
                            image: NetworkImage('https://placehold.co/200x300/png'),
                            width: 130,
                            height: 170,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text("Titulo Peli")
                    
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