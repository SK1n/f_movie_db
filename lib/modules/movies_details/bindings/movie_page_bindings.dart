import 'package:dio/dio.dart';
import 'package:f_movie_db/data/services/movie_credits_client.dart';
import 'package:f_movie_db/data/services/movie_details_client.dart';
import 'package:f_movie_db/data/services/movies_images_client.dart';
import 'package:f_movie_db/modules/movies_details/controllers/movie_item_controller.dart';
import 'package:f_movie_db/modules/movies_details/controllers/movie_credits_controller.dart';
import 'package:f_movie_db/modules/movies_details/controllers/movies_images_controller.dart';
import 'package:get/get.dart';

class MoviePageBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieCreditsController>(
      () => MovieCreditsController(
        MovieCreditsClient(),
      ),
    );
    Get.lazyPut<MovieItemController>(
      () => MovieItemController(
        MovieDetailsClient(),
      ),
    );
    Get.lazyPut<MoviesImagesController>(
      () => MoviesImagesController(
        MoviesImagesClient(),
      ),
    );
  }
}
