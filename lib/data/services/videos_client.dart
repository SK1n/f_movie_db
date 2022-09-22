import 'dart:io';

import 'package:dio/dio.dart';
import 'package:f_movie_db/core/const.dart';
import 'package:f_movie_db/core/utils/end_points.dart';
import 'package:f_movie_db/data/model/movies_results.dart';
import 'package:f_movie_db/core/utils/api_key.dart';
import 'package:f_movie_db/data/model/videos/videos.dart';
import 'package:f_movie_db/data/model/videos/videos_results.dart';
import 'package:flutter/material.dart';

class VideosClient {
  final Dio httpClient;
  String? endPoint;
  int? id;
  VideosClient({
    required this.httpClient,
    this.endPoint,
    this.id,
  });

  Future getData() async {
    try {
      var response = await httpClient.get(
        baseURL + endPoint!,
        queryParameters: {
          'api_key': apiKey,
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = response.data;
        List<VideosResults> listMovies =
            jsonResponse['results'].map<VideosResults>((map) {
          return VideosResults.fromJson(map);
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
