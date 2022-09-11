import 'package:dio/dio.dart';
import 'package:f_movie_db/core/utils/end_points.dart';
import 'package:f_movie_db/data/model/results.dart';
import 'package:f_movie_db/data/services/movies.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesUpcomingController extends GetxController {
  Future<List<Results>> getData(int offset) async {
    debugPrint('offfset: ${offset ~/ 20 + 1}');
    var dio = Dio();
    var tempUpcoming = MoviesClient(
      httpClient: dio,
      endPoint: EndPoints().moviesUpcoming,
      page: offset ~/ 20 + 1,
    );
    return await tempUpcoming.getAll();
  }
}