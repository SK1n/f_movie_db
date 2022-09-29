import 'dart:io';

import 'package:dio/dio.dart';
import 'package:f_movie_db/core/const.dart';
import 'package:f_movie_db/core/utils/end_points.dart';
import 'package:f_movie_db/data/model/movies_images/movies_images.dart';
import 'package:f_movie_db/data/model/movies/movies_results.dart';
import 'package:f_movie_db/core/utils/api_key.dart';
import 'package:flutter/material.dart';

class MoviesImagesClient {
  MoviesImagesClient();

  Future getData(int id) async {
    try {
      var response = await Dio().get(
        baseURL + EndPoints(id: id).moviesImages,
        queryParameters: {
          'api_key': apiKey,
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = response.data;
        MoviesImages data = MoviesImages.fromJson(jsonResponse);
        return data;
      } else {
        throw HttpException(
            'Code: ${response.statusCode} \nMessage: ${response.statusMessage}');
      }
    } on DioError catch (e) {
      debugPrint('Dio: ${e.message}');
    } on HttpException catch (e) {
      debugPrint(e.message);
    }
  }
}
