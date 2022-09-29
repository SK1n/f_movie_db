import 'package:f_movie_db/data/services/movies_client.dart';
import 'package:f_movie_db/modules/movies_upcoming/controllers/movies_upcoming_controller.dart';
import 'package:get/get.dart';

class MoviesUpcomingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MoviesUpcomingController>(
        () => MoviesUpcomingController(MoviesClient()));
  }
}
