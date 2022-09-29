import 'package:f_movie_db/data/services/movies_client.dart';
import 'package:f_movie_db/modules/movies_now_playing/controllers/movies_now_playing_controller.dart';
import 'package:get/get.dart';

class MoviesNowPlayingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MoviesNowPlayingController>(
      () => MoviesNowPlayingController(
        MoviesClient(),
      ),
    );
  }
}
