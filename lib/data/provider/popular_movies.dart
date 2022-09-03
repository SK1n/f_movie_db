import 'package:dio/dio.dart';
import 'package:f_movie_db/data/model/results.dart';
import 'package:f_movie_db/globals/api_secrets.dart';
import 'package:flutter/material.dart';

const baseUrl = 'https://api.themoviedb.org/3/movie/popular';

class PopularMoviesClient {
  final Dio httpClient;
  PopularMoviesClient({required this.httpClient});

  getAll() async {
    try {
      var response = await httpClient.get(
        baseUrl,
        queryParameters: {
          'api_key': apiKey,
          'page': 1,
        },
      );
      //debugPrint(json.decode(response.data).toString());
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = response.data;
        List<Results> listMovies = jsonResponse['results'].map<Results>((map) {
          return Results.fromJson(map);
        }).toList();
        debugPrint(listMovies.toString());
        return listMovies;
      } else
        debugPrint('erro -get');
    } catch (e) {}
  }
}
