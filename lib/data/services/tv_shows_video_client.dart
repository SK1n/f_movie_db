import 'package:dio/dio.dart';
import 'package:f_movie_db/core/const.dart';
import 'package:f_movie_db/core/utils/api_key.dart';
import 'package:f_movie_db/core/utils/end_points.dart';
import 'package:f_movie_db/data/model/video.dart';
import 'package:flutter/material.dart';

class TvShowsVideoClient {
  final Dio httpClient;
  int? id;
  TvShowsVideoClient({
    required this.httpClient,
    this.id,
  });

  getData() async {
    try {
      var response = await httpClient.get(
        baseURL + EndPoints(id: id).tvShowsVideo,
        queryParameters: {
          'api_key': apiKey,
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = response.data;
        Video item = Video.fromJson(jsonResponse);
        return item;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
