import 'dart:io';

import 'package:dio/dio.dart';
import 'package:f_movie_db/core/const.dart';
import 'package:f_movie_db/core/utils/end_points.dart';
import 'package:f_movie_db/data/model/movie_details/movie_details.dart';
import 'package:f_movie_db/core/utils/api_key.dart';
import 'package:flutter/material.dart';

class MovieDetailsClient {
  MovieDetailsClient();

  Future getData(id) async {
    try {
      var response = await Dio().get(
        baseURL + EndPoints(id: id).movieDetails,
        queryParameters: {
          'api_key': apiKey,
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = response.data;
        MovieDetails item = MovieDetails.fromJson(jsonResponse);

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
