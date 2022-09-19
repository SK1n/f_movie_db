import 'package:dio/dio.dart';
import 'package:f_movie_db/data/services/person_movies_credits_client.dart';
import 'package:f_movie_db/modules/person_details/controllers/person_movies_credits_controller.dart';
import 'package:get/get.dart';

class PersonMoviesCreditsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonMoviesCreditsController>(
      () => PersonMoviesCreditsController(
        PersonMoviesCreditsClient(
          httpClient: Dio(),
        ),
      ),
    );
  }
}
