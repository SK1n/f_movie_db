import 'package:dio/dio.dart';
import 'package:f_movie_db/core/utils/end_points.dart';
import 'package:f_movie_db/data/model/tv_shows/tv_shows_results.dart';
import 'package:f_movie_db/data/services/tv_shows_client.dart';
import 'package:get/get.dart';

class TvShowsPageController extends GetxController {
  final TvShowsClient client;
  TvShowsPageController(this.client);
  final _tvShowsOnTheAir = <TvShowsResults>[].obs;
  get tvShowsOnTheAir => _tvShowsOnTheAir;
  set tvShowsOnTheAir(value) => _tvShowsOnTheAir.value = value;

  final _tvShowsTopRated = <TvShowsResults>[].obs;
  get tvShowsTopRated => _tvShowsTopRated;
  set tvShowsTopRated(value) => _tvShowsTopRated.value = value;

  final _tvShowsPopular = <TvShowsResults>[].obs;
  get tvShowsPopular => _tvShowsPopular;
  set tvShowsPopular(value) => _tvShowsPopular.value = value;

  Future getData() async {
    tvShowsOnTheAir.addAll(await client.getData(EndPoints().tvShowsOnTheAir));
    tvShowsTopRated.addAll(await client.getData(EndPoints().tvShowsTopRated));
    tvShowsPopular.addAll(await client.getData(EndPoints().tvShowsPopular));
  }

  int get lengthtvShowsPopular => tvShowsPopular.length;
  int get lengthtvShowsTopRated => tvShowsTopRated.length;
  int get lengthtvShowsOnTheAir => tvShowsOnTheAir.length;
}
