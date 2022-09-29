import 'package:f_movie_db/data/services/tv_shows_client.dart';
import 'package:f_movie_db/modules/tv_shows_page/controllers/tv_shows_page_controller.dart';
import 'package:get/get.dart';

class TvShowsPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TvShowsPageController>(
      () => TvShowsPageController(
        TvShowsClient(),
      ),
    );
  }
}
