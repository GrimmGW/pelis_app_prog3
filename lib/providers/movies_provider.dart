
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class MoviesProvider extends ChangeNotifier{

  final String _apiKey = '2136248d54a84c6f12f8956d99ac2ace';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';
  final String endpoint = '/3/movie/now_playing';

  MoviesProvider(){
    print('MoviesProvider esta inicializado');

    _getJsonData();
  }

  Future<String> _getJsonData([int? page = 1]) async {

    // http escribe automaticamente: https://
    var url = Uri.http(_baseUrl, endpoint,{
      'api_key' : _apiKey,
      'language' : _language,
      'page' : '$page'
    });

    final response = await http.get(url);
    print(response.body);
    return response.body;

  }

  // getOnDisplayMovies() async {
  //   print('getOnDisplayMovies');

  //   final jsonData = await this._getJsonData('/3/movie/now_playing');
  //   final nowPlayingResponse = 
  // }

}