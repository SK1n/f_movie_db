import 'package:dio/dio.dart';
import 'package:f_movie_db/data/services/movie_details_client.dart';
import 'package:f_movie_db/widgets/movie_list_item_view.dart/controllers/movie_list_item_controller.dart';
import 'package:get/get.dart';

class MovieItemBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieListItemController>(
      () => MovieListItemController(
        MovieDetailsClient(
          httpClient: Dio(),
        ),
      ),
    );
  }
}
