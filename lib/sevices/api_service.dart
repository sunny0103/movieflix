import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movieflix/models/movie_detail_model.dart';
import 'package:movieflix/models/movie_model.dart';

class ApiService {
  static const String baseUrl = "https://movies-api.nomadcoders.workers.dev";
  static const String popular = "popular";
  static const String nowPlaying = "now-playing";
  static const String comingSoon = "coming-soon";

  static Future<List<MovieModel>> getPopularMovies() async {
    List<MovieModel> movieInstances = [];
    final url = Uri.parse('$baseUrl/$popular');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> movieFormat = jsonDecode(response.body);
      final List<dynamic> movieInfo = movieFormat['results'];
      for (var movie in movieInfo) {
        final popmovie = MovieModel.fromJson(movie);
        movieInstances.add(popmovie);
      }
      return movieInstances;
    }
    throw Error();
  }

  static Future<List<MovieModel>> getNowPlaying() async {
    List<MovieModel> movieInstances = [];
    final url = Uri.parse('$baseUrl/$nowPlaying');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> movieFormat = jsonDecode(response.body);
      final List<dynamic> movieInfo = movieFormat['results'];
      for (var movie in movieInfo) {
        final nowmovie = MovieModel.fromJson(movie);
        movieInstances.add(nowmovie);
      }
      return movieInstances;
    }
    throw Error();
  }

  static Future<List<MovieModel>> getComingSoon() async {
    List<MovieModel> movieInstances = [];
    final url = Uri.parse('$baseUrl/$comingSoon');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> movieFormat = jsonDecode(response.body);
      final List<dynamic> movieInfo = movieFormat['results'];
      for (var movie in movieInfo) {
        final soonmovie = MovieModel.fromJson(movie);
        movieInstances.add(soonmovie);
      }
      return movieInstances;
    }
    throw Error();
  }

  static Future<MovieDetailModel> getMovieById(int id) async {
    try {
      // Change URL format to match the API endpoint structure
      final url = Uri.parse('$baseUrl/movie?id=$id');

      // Print URL for debugging
      print('Requesting URL: $url');

      final response = await http.get(url);

      // Print response for debugging
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> movieData = jsonDecode(response.body);
        return MovieDetailModel.fromJson(movieData);
      }

      throw Error.safeToString(
        'Failed to load movie data: ${response.statusCode}',
      );
    } catch (e) {
      print('Error fetching movie details: $e');
      rethrow; // This will help preserve the original error stack trace
    }
  }
}
