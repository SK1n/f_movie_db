import 'dart:io';

import 'package:dio/dio.dart';
import 'package:f_movie_db/core/const.dart';
import 'package:f_movie_db/core/utils/end_points.dart';
import 'package:f_movie_db/data/model/tv_shows_details/tv_shows_details.dart';
import 'package:f_movie_db/globals/api_secrets.dart';
import 'package:flutter/material.dart';

class TvShowsDetailsClient {
  final Dio httpClient;
  int? id;
  TvShowsDetailsClient({
    required this.httpClient,
    this.id,
  });

  Future getData() async {
    try {
      var response = await httpClient.get(
        baseURL + EndPoints(id: id).tvShowsDetails,
        queryParameters: {
          'api_key': apiKey,
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = response.data;
        TvShowsDetails item = TvShowsDetails.fromJson(jsonResponse);
        return item;
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
