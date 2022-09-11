import 'package:f_movie_db/widgets/bottom_navigation_bar/controllers/bottom_navigation_bar_controller.dart';
import 'package:get/get.dart';

class BottomNavigationBarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavigationBarController>(
        () => BottomNavigationBarController());
  }
}
