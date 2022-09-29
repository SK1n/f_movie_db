import 'package:dio/dio.dart';
import 'package:f_movie_db/core/utils/end_points.dart';
import 'package:f_movie_db/data/model/movies/movies_results.dart';
import 'package:f_movie_db/data/services/movies_client.dart';
import 'package:get/get.dart';

class MoviesNowPlayingController extends GetxController {
  final MoviesClient client;
  MoviesNowPlayingController(this.client);
  Future<List<MoviesResults>> getData(int offset) async {
    return await client.getData(
      EndPoints().moviesNowPlaying,
      page: offset ~/ 20 + 1,
    );
  }
}
