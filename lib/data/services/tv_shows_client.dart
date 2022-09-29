import 'dart:io';

import 'package:dio/dio.dart';
import 'package:f_movie_db/core/const.dart';
import 'package:f_movie_db/data/model/tv_shows/tv_shows_results.dart';
import 'package:f_movie_db/core/utils/api_key.dart';
import 'package:flutter/material.dart';

class TvShowsClient {
  TvShowsClient();

  Future getData(endPoint, {page = 1}) async {
    try {
      var response = await Dio().get(
        baseURL + endPoint,
        queryParameters: {
          'api_key': apiKey,
          'page': page,
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = response.data;
        List<TvShowsResults> data =
            jsonResponse['results'].map<TvShowsResults>((map) {
          return TvShowsResults.fromJson(map);
        }).toList();
        return data;
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
