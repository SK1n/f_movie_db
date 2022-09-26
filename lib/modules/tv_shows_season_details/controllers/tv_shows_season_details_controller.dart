import 'package:f_movie_db/data/model/tv_shows_details/tv_shows_details_seasons.dart';
import 'package:f_movie_db/data/model/tv_shows_season_details/tv_shows_season_details.dart';
import 'package:f_movie_db/data/services/tv_shows_season_details_client.dart';
import 'package:get/get.dart';

class TvShowsSeasonDetailsController extends GetxController {
  final TvShowsSeasonDetailsClient client;
  TvShowsSeasonDetailsController(this.client);

  Future<TvShowsSeasonDetails> getData(int? id, int? season) async {
    client.id = id;
    client.season = season;
    return await client.getData();
  }
}
