import 'package:dio/dio.dart';
import 'package:f_movie_db/core/utils/base_url.dart';
import 'package:f_movie_db/data/model/movies_results.dart';
import 'package:f_movie_db/data/model/tv_shows_results.dart';
import 'package:f_movie_db/globals/api_secrets.dart';
import 'package:flutter/material.dart';

class TvShowsClient {
  final Dio httpClient;
  final String endPoint;
  final int page;
  TvShowsClient({
    required this.httpClient,
    required this.endPoint,
    this.page = 1,
  });

  getAll() async {
    try {
      debugPrint('URL: $baseURL$endPoint?api_key=$apiKey&page=$page');
      var response = await httpClient.get(
        baseURL + endPoint,
        queryParameters: {
          'api_key': apiKey,
          'page': page,
        },
      );
      debugPrint('response: ${response.data['results']}');

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = response.data;
        List<TvShowsResults> listMovies =
            jsonResponse['results'].map<TvShowsResults>((map) {
          return TvShowsResults.fromJson(map);
        }).toList();
        return listMovies;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
