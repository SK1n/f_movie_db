import 'dart:io';

import 'package:dio/dio.dart';
import 'package:f_movie_db/core/const.dart';
import 'package:f_movie_db/core/utils/end_points.dart';
import 'package:f_movie_db/core/utils/api_key.dart';
import 'package:f_movie_db/data/model/person_movies_credits/person_movies_credits.dart';
import 'package:flutter/material.dart';

class PersonMoviesCreditsClient {
  final Dio httpClient;
  int? id;
  PersonMoviesCreditsClient({required this.httpClient, this.id});

  getData() async {
    try {
      var response = await httpClient.get(
        baseURL + EndPoints(id: id).personMoviesCredits,
        queryParameters: {
          'api_key': apiKey,
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = response.data;
        PersonMoviesCredits item = PersonMoviesCredits.fromJson(jsonResponse);
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
