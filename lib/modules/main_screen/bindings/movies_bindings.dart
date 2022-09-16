import 'package:dio/dio.dart';
import 'package:f_movie_db/data/services/movies_client.dart';
import 'package:f_movie_db/modules/main_screen/controllers/movies_controller.dart';
import 'package:get/get.dart';

class MoviesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MoviesController>(
        () => MoviesController(MoviesClient(httpClient: Dio())));
  }
}
