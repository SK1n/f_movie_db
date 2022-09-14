import 'package:f_movie_db/modules/movie/controllers/movie_person_item_controller.dart';
import 'package:f_movie_db/modules/tv_show/controllers/tv_shows_person_item_controller.dart';
import 'package:get/get.dart';

class TvShowsPersonItemBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TvShowsPersonItemController>(
        () => TvShowsPersonItemController());
  }
}
