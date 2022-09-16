import 'package:f_movie_db/data/model/video_results.dart';
import 'package:f_movie_db/data/services/tv_shows_credits_client.dart';
import 'package:get/get.dart';

class TvShowsCreditsController extends GetxController {
  final TvShowsCreditsClient client;
  TvShowsCreditsController(this.client);

  final _video = <VideoResults>[].obs;
  get video => _video;
  set video(value) => _video.value = value;

  Future<TvShowsCreditsClient> getData(tvShowId) async {
    client.id = tvShowId;
    return await client.getData();
  }
}
