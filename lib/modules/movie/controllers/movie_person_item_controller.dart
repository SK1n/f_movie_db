import 'package:dio/dio.dart';
import 'package:f_movie_db/core/utils/end_points.dart';
import 'package:f_movie_db/data/model/cast.dart';
import 'package:f_movie_db/data/model/crew.dart';
import 'package:f_movie_db/data/services/cast_crew_client.dart';
import 'package:f_movie_db/data/services/crew_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviePersonItemController extends GetxController {
  final _crew = <Crew>[].obs;
  get crew => _crew;
  set crew(value) => _crew.value = value;

  final _cast = <Cast>[].obs;
  get cast => _cast;
  set cast(value) => _cast.value = value;
  getData(movieId) async {
    var dio = Dio();
    var tempCrew = CrewClient(
      httpClient: dio,
      endPoint: EndPoints(id: movieId).moviesCredits,
    );
    // var tempCast = CastClient(
    //   httpClient: dio,
    //   endPoint: EndPoints(id: movieId).moviesCredits,
    // );

    crew.addAll(await tempCrew.getAll());
    //cast.addAll(await tempCast.getAll());
  }

  int get lengthCrew => crew.length;
  int get lengthCast => cast.length;
}
