import 'package:f_movie_db/data/services/tv_shows_credits_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TvShowsCreditsController extends GetxController {
  final TvShowsCreditsClient client;
  TvShowsCreditsController(this.client);

  Future getData(id) async {
    return await client.getData(id);
  }
}
