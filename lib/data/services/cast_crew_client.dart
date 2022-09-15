import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:f_movie_db/core/utils/base_url.dart';
import 'package:f_movie_db/data/model/cast.dart';
import 'package:f_movie_db/data/model/credits.dart';
import 'package:f_movie_db/globals/api_secrets.dart';
import 'package:flutter/material.dart';

class CastCrewClient {
  final Dio httpClient;
  final String endPoint;
  CastCrewClient({required this.httpClient, required this.endPoint});

  getData() async {
    debugPrint('URL: $baseURL$endPoint?api_key=$apiKey');
    try {
      var response = await httpClient.get(
        baseURL + endPoint,
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
