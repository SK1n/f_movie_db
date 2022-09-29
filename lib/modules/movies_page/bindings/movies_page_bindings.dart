import 'package:dio/dio.dart';
import 'package:f_movie_db/data/services/movies_client.dart';
import 'package:f_movie_db/modules/movies_page/controllers/movies_page_controller.dart';
import 'package:get/get.dart';

class MoviesPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MoviesPageController>(
        () => MoviesPageController(MoviesClient()));
  }
}
