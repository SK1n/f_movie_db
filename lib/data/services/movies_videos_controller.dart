import 'dart:io';

import 'package:dio/dio.dart';
import 'package:f_movie_db/core/const.dart';
import 'package:f_movie_db/core/utils/end_points.dart';
import 'package:f_movie_db/data/model/movies_results.dart';
import 'package:f_movie_db/core/utils/api_key.dart';
import 'package:f_movie_db/data/model/movies_videos/movies_videos.dart';
import 'package:f_movie_db/data/model/movies_videos/movies_videos_results.dart';
import 'package:flutter/material.dart';

class MoviesVideosClient {
  final Dio httpClient;
  int? id;
  MoviesVideosClient({
    required this.httpClient,
    this.id,
  });

  Future getData() async {
    try {
      var response = await httpClient.get(
        baseURL + EndPoints(id: id).moviesVideosResults,
        queryParameters: {
          'api_key': apiKey,
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = response.data;
        List<MoviesVideosResults> listMovies =
            jsonResponse['results'].map<MoviesVideosResults>((map) {
          return MoviesVideosResults.fromJson(map);
        }).toList();
        return listMovies;
      } else {
        throw HttpException(
            'Code: ${response.statusCode} \nMessage: ${response.statusMessage}');
      }
    } on DioError catch (e) {
      debugPrint('snapshot: ${e.message}');
    } on HttpException catch (e) {
      debugPrint(e.message);
    }
  }
}
