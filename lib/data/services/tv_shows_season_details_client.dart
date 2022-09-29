import 'dart:io';

import 'package:dio/dio.dart';
import 'package:f_movie_db/core/const.dart';
import 'package:f_movie_db/core/utils/end_points.dart';
import 'package:f_movie_db/core/utils/api_key.dart';
import 'package:f_movie_db/data/model/tv_shows_season_details/tv_shows_season_details.dart';
import 'package:flutter/material.dart';

class TvShowsSeasonDetailsClient {
  TvShowsSeasonDetailsClient();

  Future getData(id, season) async {
    try {
      var response = await Dio().get(
        baseURL + EndPoints(id: id, season: season).tvShowsSeasonDetails,
        queryParameters: {
          'api_key': apiKey,
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = response.data;
        TvShowsSeasonDetails item = TvShowsSeasonDetails.fromJson(jsonResponse);
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
