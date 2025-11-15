import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemCount: 10,
        itemBuilder: (context, index){
          return ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(16),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'), 
              image: NetworkImage('https://placehold.co/400x500/png'),
              fit: BoxFit.cover,
            ),
          );
        }
      ),
    );
  }
}