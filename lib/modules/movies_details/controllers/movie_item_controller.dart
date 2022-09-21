import 'package:f_movie_db/data/model/movie_details/movie_details_genres.dart';
import 'package:f_movie_db/data/services/movie_details_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieItemController extends GetxController {
  final MovieDetailsClient client;
  MovieItemController(this.client);

  Future getData(id) async {
    client.id = id;
    return await client.getData();
  }

  final _biggest = 0.0.obs;
  get biggest => _biggest.value;
  set biggest(value) => _biggest.value = value;

  String createDetailsText(
      String? releaseDate, List<MovieDetailsGenres>? genres, runtime) {
    String details = '';
    details = releaseDate ?? '';
    genres!.isNotEmpty ? details = details : DoNothingAction();
    for (var element in genres) {
      details = '$details • ${element.name}';
    }
    details = details.toUpperCase();
    String time;
    if (runtime == null) {
      time = '';
    } else {
      time = '${runtime}m';
      details = '$details • $time';
    }

    return details;
  }
}

extension Trim on String {
  String displayOnlyOneDecimal() {
    return substring(0, 3);
  }
}
