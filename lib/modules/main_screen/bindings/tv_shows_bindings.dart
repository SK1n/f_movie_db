import 'package:f_movie_db/modules/main_screen/controllers/tv_shows_controller.dart';
import 'package:get/get.dart';

class TvShowsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TvShowsController>(() => TvShowsController());
  }
}
