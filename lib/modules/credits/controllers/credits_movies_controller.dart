import 'package:dio/dio.dart';
import 'package:f_movie_db/data/model/credits_movies_cast.dart';
import 'package:f_movie_db/data/model/credits_movies_crew.dart';
import 'package:f_movie_db/data/services/credits_movies_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreditsMoviesController extends GetxController {
  final _crew = <CreditsMoviesCrew>[].obs;
  get crew => _crew;
  set crew(value) => _crew.value = value;

  final _cast = <CreditsMoviesCast>[].obs;
  get cast => _cast;
  set cast(value) => _cast.value = value;

  Future getMoviesCreditsData(creditId) async {
    var dio = Dio();
    var client = CreditsMoviesClient(httpClient: dio, id: creditId);
    var data = await client.getData();
    try {
      crew = data['crew'].map<CreditsMoviesCrew>((map) {
        return CreditsMoviesCrew.fromJson(map);
      }).toList();
      cast = data['cast'].map<CreditsMoviesCast>((map) {
        return CreditsMoviesCast.fromJson(map);
      }).toList();
    } catch (e) {
      debugPrint('getData: $e');
    }
  }
}
