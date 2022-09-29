import 'package:f_movie_db/core/utils/end_points.dart';
import 'package:f_movie_db/data/model/videos/videos.dart';

import 'package:f_movie_db/data/services/videos_client.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TvShowsVideoController extends GetxController {
  final VideosClient client;
  TvShowsVideoController(this.client);

  YoutubePlayerController? videoPlayerController;
  Future getVideo(id) async {
    Videos videos = await client.getData(id, EndPoints(id: id).tvShowsVideo);
    String key = videos.results!.isNotEmpty ? videos.results![0].key! : '';
    videoPlayerController = YoutubePlayerController(
        initialVideoId: key,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ));
  }
}
