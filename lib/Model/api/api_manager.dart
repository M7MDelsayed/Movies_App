import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/Model/movie_details/MoviesDetails.dart';
import 'package:movies_app/Model/movie_top_rated/MovieTopRated.dart';

import '../movie_popular/MoviePopular.dart';
import '../movie_similar/MoviesSimilar.dart';

class ApiManager {
  static const String baseUrl = 'api.themoviedb.org';
  static const String apiKey = 'ea25953ef2acb53f434964cc5e9239db';

  static Future<MoviePopular> getPopularMovie() async {
    var url = Uri.https(baseUrl, '/3/movie/popular', {"api_key": apiKey});
    var response = await http.get(url);
    return MoviePopular.fromJson(
      jsonDecode(response.body),
    );
  }

  static Future<MovieTopRated> getTopRatedMovie() async {
    var url = Uri.https(baseUrl, '/3/movie/top_rated', {"api_key": apiKey});
    var response = await http.get(url);
    return MovieTopRated.fromJson(
      jsonDecode(response.body),
    );
  }

  static Future<MoviesDetails> getMovieDetails(int id) async {
    var url = Uri.https(baseUrl, '/3/movie/$id', {"api_key": apiKey});
    var response = await http.get(url);
    return MoviesDetails.fromJson(
      jsonDecode(response.body),
    );
  }

  static Future<MoviesSimilar> getMoviesSimilar(int id) async {
    var url = Uri.https(baseUrl, '/3/movie/$id/similar', {"api_key": apiKey});
    var response = await http.get(url);
    return MoviesSimilar.fromJson(
      jsonDecode(response.body),
    );
  }
}
