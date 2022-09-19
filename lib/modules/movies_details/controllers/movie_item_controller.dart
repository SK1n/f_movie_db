import 'package:f_movie_db/data/services/movie_details_client.dart';
import 'package:get/get.dart';

class MovieItemController extends GetxController {
  final MovieDetailsClient client;
  MovieItemController(this.client);

  Future getData(id) async {
    client.id = id;
    return await client.getData();
  }
}
