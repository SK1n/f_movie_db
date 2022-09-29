import 'package:dio/dio.dart';
import 'package:f_movie_db/data/services/tv_shows_credits_client.dart';
import 'package:f_movie_db/data/services/tv_shows_details_client.dart';
import 'package:f_movie_db/data/services/videos_client.dart';
import 'package:f_movie_db/modules/tv_shows_details/controllers/tv_shows_credits_controller.dart';
import 'package:f_movie_db/modules/tv_shows_details/controllers/tv_shows_item_controller.dart';
import 'package:f_movie_db/modules/tv_shows_details/controllers/tv_shows_video_controller.dart';
import 'package:get/get.dart';

class TvShowsDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TvShowsCreditsController>(
      () => TvShowsCreditsController(
        TvShowsCreditsClient(),
      ),
    );
    Get.lazyPut<TvShowsItemController>(
      () => TvShowsItemController(
        TvShowsDetailsClient(),
      ),
    );
    Get.lazyPut<TvShowsVideoController>(
      () => TvShowsVideoController(
        VideosClient(),
      ),
    );
  }
}
