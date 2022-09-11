import 'package:dio/dio.dart';
import 'package:f_movie_db/core/utils/base_url.dart';
import 'package:f_movie_db/data/model/cast.dart';
import 'package:f_movie_db/globals/api_secrets.dart';
import 'package:flutter/material.dart';

class CastClient {
  final Dio httpClient;
  final String endPoint;
  CastClient({required this.httpClient, required this.endPoint});

  getAll() async {
    try {
      var response = await httpClient.get(
        baseURL + endPoint,
        queryParameters: {
          'api_key': apiKey,
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = response.data;
        List<Cast> listMovies = jsonResponse['cast'].map<Cast>((map) {
          return Cast.fromJson(map);
        }).toList();
        return listMovies;
      }
    } catch (e) {}
  }
}
