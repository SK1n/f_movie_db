import 'package:dio/dio.dart';
import 'package:f_movie_db/core/const.dart';
import 'package:f_movie_db/core/utils/end_points.dart';
import 'package:f_movie_db/data/model/tv_shows_credits.dart/tv_shows_credits.dart';
import 'package:f_movie_db/globals/api_secrets.dart';
import 'package:flutter/material.dart';

class TvShowsCreditsClient {
  final Dio httpClient;
  int? id;
  TvShowsCreditsClient({required this.httpClient, this.id});

  getData() async {
    try {
      var response = await httpClient.get(
        baseURL + EndPoints(id: id).creditsTvShows,
        queryParameters: {
          'api_key': apiKey,
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = response.data;
        TvShowsCredits item = TvShowsCredits.fromJson(jsonResponse);
        return item;
      }
    } on DioError catch (e) {
      debugPrint('snapshot: ${e.message}');
    }
  }
}
