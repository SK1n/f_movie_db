import 'package:f_movie_db/modules/movie/controllers/movie_person_item_controller.dart';
import 'package:get/get.dart';

class MoviePersonItemBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MoviePersonItemController>(() => MoviePersonItemController());
  }
}
