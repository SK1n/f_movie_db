import 'package:f_movie_db/modules/credits/controllers/credits_controller.dart';
import 'package:f_movie_db/modules/credits/controllers/credits_movies_controller.dart';
import 'package:get/get.dart';

class CreditsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreditsController>(() => CreditsController());
    Get.lazyPut<CreditsMoviesController>(() => CreditsMoviesController());
  }
}
