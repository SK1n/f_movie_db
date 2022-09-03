import 'package:dio/dio.dart';
import 'package:f_movie_db/data/provider/now_playing_movies.dart';
import 'package:f_movie_db/data/provider/popular_movies.dart';
import 'package:f_movie_db/data/provider/upcoming_movies%20.dart';
import 'package:get/get.dart';

class NowPlayingController extends GetxController {
  NowPlayingController();

  getDataNowPlayingMovies() async {
    var dio = Dio();
    var movies = NowPlayingMoviesClient(httpClient: dio);
    return await movies.getAll();
  }

  getDataPopularMovies() async {
    var dio = Dio();
    var movies = PopularMoviesClient(httpClient: dio);
    return await movies.getAll();
  }

  getDataUpcomingMovies() async {
    var dio = Dio();
    var movies = UpcomingMoviesClient(httpClient: dio);
    return await movies.getAll();
  }
}
