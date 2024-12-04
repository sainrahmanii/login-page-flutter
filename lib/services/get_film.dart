import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_flutter/config/config.dart';
import 'package:project_flutter/model/film_model.dart';
import 'package:project_flutter/model/popular_film_response_model.dart';

class GetFilm {
  Future<List<FilmModel>> getPopularFilm() async {
    var url = Uri.parse('$baseUrl/movie/popular?api_key=$apiKey');

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      PopularFilmResponseModel popularFilmResponseModel =
          PopularFilmResponseModel.fromJson(jsonResponse);
      return popularFilmResponseModel.results ?? [];
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return [];
    }
  }

  Future<List<FilmModel>> getTopRatedFilm() async {
    var url = Uri.parse('$baseUrl/movie/top_rated?api_key=$apiKey');

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      PopularFilmResponseModel popularFilmResponseModel =
          PopularFilmResponseModel.fromJson(jsonResponse);
      return popularFilmResponseModel.results ?? [];
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return [];
    }
  }

  Future<List<FilmModel>> getUpcomingFilm() async {
    var url = Uri.parse('$baseUrl/movie/upcoming?api_key=$apiKey');

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      PopularFilmResponseModel popularFilmResponseModel =
          PopularFilmResponseModel.fromJson(jsonResponse);
      return popularFilmResponseModel.results ?? [];
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return [];
    }
  }
}
