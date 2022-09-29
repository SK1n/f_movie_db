import 'package:dio/dio.dart';
import 'package:f_movie_db/data/services/tv_shows_season_details_client.dart';
import 'package:f_movie_db/modules/tv_shows_season_details/controllers/tv_shows_season_details_controller.dart';
import 'package:get/get.dart';

class TvShowsSeasonDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TvShowsSeasonDetailsController>(
      () => TvShowsSeasonDetailsController(
        TvShowsSeasonDetailsClient(),
      ),
    );
  }
}
