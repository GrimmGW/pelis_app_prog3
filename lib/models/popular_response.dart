import 'dart:convert';
import 'package:peliculas_app_prog3/models/models.dart';

class PopularResponse {
    int page;
    List<Movie> movies;
    int totalPages;
    int totalResults;

    PopularResponse({
        required this.page,
        required this.movies,
        required this.totalPages,
        required this.totalResults,
    });

    factory PopularResponse.fromJson(String str) => PopularResponse.fromMap(json.decode(str));

    factory PopularResponse.fromMap(Map<String, dynamic> json) => PopularResponse(
        page: json["page"],
        movies: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );
}