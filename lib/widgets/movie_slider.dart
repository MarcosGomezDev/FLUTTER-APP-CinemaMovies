// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  // const MovieSlider({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 285,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('Populares', style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold)),
          ),

          const SizedBox(height: 8),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) => _MoviePoster(),
            ),
          ),

          const SizedBox(height: 5),
          
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 130,
        height: 190,
        margin: const EdgeInsets.symmetric(horizontal: 7),
        child: Column(
          children: [

            GestureDetector(
              onTap: (() => Navigator.pushNamed(
              context, 'details', 
              arguments: 'movie-instance'
              )),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const FadeInImage(
                  placeholder: AssetImage('assets/no-image.jpg'), 
                  image: NetworkImage('http://via.placeholder.com/300x400.jpg'),
                  width: 130,
                  height: 190,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox( height: 5 ),

            const Text(
              'Star War: El despertar de la fuerza',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),


          ],
        ),
      );
  }
}