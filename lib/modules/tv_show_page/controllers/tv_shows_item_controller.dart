import 'package:f_movie_db/data/model/tv_shows_details/tv_shows_details.dart';
import 'package:f_movie_db/data/services/tv_shows_details_client.dart';
import 'package:get/get.dart';

class TvShowsItemController extends GetxController {
  final TvShowsDetailsClient client;
  TvShowsItemController(this.client);

  Future<TvShowsDetails> getData(tvShowId) async {
    client.id = tvShowId;
    return await client.getData();
  }
}
