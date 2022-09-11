import 'package:f_movie_db/modules/movie/controllers/person_item_controller.dart';
import 'package:get/get.dart';

class PersonItemBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonItemController>(() => PersonItemController());
  }
}
