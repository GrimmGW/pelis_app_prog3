import 'package:flutter/material.dart';
import 'package:peliculas_app_prog3/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla principal'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper(),

            MovieSlider(),
          ],
        ),
      ),
    );
  }
}