import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:f_movie_db/core/utils/base_url.dart';
import 'package:f_movie_db/core/utils/end_points.dart';
import 'package:f_movie_db/data/model/cast.dart';
import 'package:f_movie_db/data/model/credits.dart';
import 'package:f_movie_db/globals/api_secrets.dart';
import 'package:flutter/material.dart';

class PersonDetailsClient {
  final Dio httpClient;
  final int id;
  PersonDetailsClient({required this.httpClient, required this.id});

  getData() async {
    try {
      var response = await httpClient.get(
        baseURL + EndPoints(id: id).personDetails,
        queryParameters: {
          'api_key': apiKey,
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = response.data;
        return jsonResponse;
      }
    } on DioError catch (e) {
      debugPrint('snapshot: ${e.message}');
    }
  }
}
