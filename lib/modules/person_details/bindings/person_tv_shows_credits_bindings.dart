import 'package:dio/dio.dart';
import 'package:f_movie_db/data/services/person_tv_shows_credits_client.dart';
import 'package:f_movie_db/modules/person_details/controllers/person_tv_shows_credits_controller.dart';
import 'package:get/get.dart';

class PersonTvShowsCreditsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonTvShowsCreditsController>(
      () => PersonTvShowsCreditsController(
        PersonTvShowsCreditsClient(),
      ),
    );
  }
}
