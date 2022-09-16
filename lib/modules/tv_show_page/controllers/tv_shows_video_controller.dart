import 'package:f_movie_db/data/model/video.dart';
import 'package:f_movie_db/data/services/tv_shows_video_client.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TvShowsVideoController extends GetxController {
  final TvShowsVideoClient client;
  TvShowsVideoController(this.client);

  YoutubePlayerController? videoPlayerController;
  Future getVideo(int videoId) async {
    client.id = videoId;
    Video videos = await client.getData();
    String key = videos.results!.isNotEmpty ? videos.results![0].key! : '';
    videoPlayerController = YoutubePlayerController(
        initialVideoId: key,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ));
  }
}
