import 'package:f_movie_db/modules/main_screen/controllers/now_playing_controller.dart';
import 'package:get/get.dart';

class NowPlayingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NowPlayingController>(() => NowPlayingController());
  }
}
