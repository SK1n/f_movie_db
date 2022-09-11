import 'package:dio/dio.dart';
import 'package:f_movie_db/core/utils/base_url.dart';
import 'package:f_movie_db/data/model/crew.dart';
import 'package:f_movie_db/data/model/results.dart';
import 'package:f_movie_db/globals/api_secrets.dart';
import 'package:flutter/material.dart';

class CrewClient {
  final Dio httpClient;
  final String endPoint;
  CrewClient({required this.httpClient, required this.endPoint});

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
        List<Crew> listMovies = jsonResponse['crew'].map<Crew>((map) {
          return Crew.fromJson(map);
        }).toList();

        return listMovies;
      }
    } catch (e) {}
  }
}
