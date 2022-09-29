import 'package:f_movie_db/data/services/movie_details_client.dart';
import 'package:f_movie_db/data/services/movies_images_client.dart';
import 'package:get/get.dart';

class MoviesImagesController extends GetxController {
  final MoviesImagesClient client;
  MoviesImagesController(this.client);

  Future getData(int id) async {
    return await client.getData(id);
  }
}
