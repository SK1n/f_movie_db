import 'package:dio/dio.dart';
import 'package:f_movie_db/core/const.dart';
import 'package:f_movie_db/core/utils/end_points.dart';
import 'package:f_movie_db/data/model/movie_credits/movie_credits.dart';
import 'package:f_movie_db/globals/api_secrets.dart';
import 'package:flutter/material.dart';

class MovieCreditsClient {
  final Dio httpClient;
  int? id;
  MovieCreditsClient({required this.httpClient, this.id});

  getData() async {
    try {
      var response = await httpClient.get(
        baseURL + EndPoints(id: id).moviesCredits,
        queryParameters: {
          'api_key': apiKey,
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = response.data;
        MovieCredits item = MovieCredits.fromJson(jsonResponse);
        return item;
      }
    } on DioError catch (e) {
      debugPrint('snapshot: ${e.message}');
    }
  }
}
