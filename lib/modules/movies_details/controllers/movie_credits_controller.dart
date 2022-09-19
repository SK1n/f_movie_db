import 'package:f_movie_db/data/model/movie_credits/movie_credits.dart';
import 'package:f_movie_db/data/services/movie_credits_client.dart';
import 'package:get/get.dart';

class MovieCreditsController extends GetxController {
  final MovieCreditsClient client;
  MovieCreditsController(this.client);

  Future<MovieCredits> getData(movieId) async {
    client.id = movieId;
    return await client.getData();
  }
}
