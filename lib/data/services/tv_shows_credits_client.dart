import 'dart:io';

import 'package:dio/dio.dart';
import 'package:f_movie_db/core/const.dart';
import 'package:f_movie_db/core/utils/end_points.dart';
import 'package:f_movie_db/data/model/tv_shows_credits/tv_shows_credits.dart';
import 'package:f_movie_db/core/utils/api_key.dart';
import 'package:flutter/material.dart';

class TvShowsCreditsClient {
  TvShowsCreditsClient();

  Future getData(id) async {
    try {
      var response = await Dio().get(
        baseURL + EndPoints(id: id).tvShowsCredits,
        queryParameters: {
          'api_key': apiKey,
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = response.data;
        TvShowsCredits item = TvShowsCredits.fromJson(jsonResponse);
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
