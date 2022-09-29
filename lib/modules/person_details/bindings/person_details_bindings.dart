import 'package:dio/dio.dart';
import 'package:f_movie_db/data/services/person_details_client.dart';
import 'package:f_movie_db/modules/person_details/controllers/person_details_controller.dart';
import 'package:get/get.dart';

class PersonDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonDetailsController>(
      () => PersonDetailsController(
        PersonDetailsClient(),
      ),
    );
  }
}
