import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:movies/models/models.dart';
import 'package:movies/models/search_response.dart';

class MoviesProvider extends ChangeNotifier {

  final String _apiKey   = 'd169537940d97d029253987c565af8e1';
  final String _baseUrl  = 'api.themoviedb.org';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  Map<int, List<Cast>> moviesCast = {};

  int _popularPage = 0;

  MoviesProvider() {
    print('MoviesProvider inicializado');
    getOnDisplaymovies();
    getPopularmovies();
  }

  getOnDisplaymovies() async{
    
    final jsonData = await _getJsonData('3/movie/now_playing');

    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);

    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }

  getPopularmovies() async {

    _popularPage++;

    final jsonData = await _getJsonData('3/movie/popular', _popularPage);

    final popularResponse = PopularResponse.fromJson(jsonData);

    popularMovies = [...popularMovies, ...popularResponse.results];
    // popularMovies = popularResponse.results;

    notifyListeners();
  }

  Future<String> _getJsonData( String endPoint, [int page = 1] ) async {
    final url = Uri.https(_baseUrl, endPoint,  
      {
        'api_key' : _apiKey,
        'language' : _language,
        'page' : '$page',
      }
    );

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    return response.body;
  }

  Future<List<Cast>> getMoviesCast( int movieId ) async {
    
    if (moviesCast.containsKey(movieId)) return moviesCast[movieId]!;

    print('Pidiendo info al servidor - Cast');

    final jsonData = await _getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(jsonData);

    moviesCast[movieId] = creditsResponse.cast;

    return creditsResponse.cast;

  }

  Future<List<Movie>> searchMovies( String query ) async {

    final url = Uri.https(_baseUrl, '3/search/movie',  
      {
        'api_key' : _apiKey,
        'language' : _language,
        'query': query
      }
    );

    final response = await http.get(url);
    final searchResponse = SearchResponse.fromJson( response.body );

    return searchResponse.results;

  }

}