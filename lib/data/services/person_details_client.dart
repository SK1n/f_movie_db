import 'package:dio/dio.dart';
import 'package:f_movie_db/core/const.dart';
import 'package:f_movie_db/core/utils/end_points.dart';
import 'package:f_movie_db/data/model/person_details/person_details.dart';
import 'package:f_movie_db/core/utils/api_key.dart';
import 'package:flutter/material.dart';

class PersonDetailsClient {
  PersonDetailsClient();

  getData(id) async {
    try {
      var response = await Dio().get(
        baseURL + EndPoints(id: id).personDetails,
        queryParameters: {
          'api_key': apiKey,
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = response.data;
        PersonDetails item = PersonDetails.fromJson(jsonResponse);
        return item;
      }
    } on DioError catch (e) {
      debugPrint('snapshot: ${e.message}');
    }
  }
}
