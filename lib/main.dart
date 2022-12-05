// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:movies/screens/screens.dart';

void main() => runApp(MoviesApp());

class MoviesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Películas',
      initialRoute: 'home',
      routes: {
        'home':    ( _ ) => HomeScreen(),
        'details': ( _ ) => DetailsScreen(),

      },
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          color: Colors.red
        )
      ),
    );
  }
}