import 'package:f_movie_db/modules/movies_popular/controllers/movies_popular_controller.dart';
import 'package:get/get.dart';

class MoviesPopularBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MoviesPopularController>(() => MoviesPopularController());
  }
}
