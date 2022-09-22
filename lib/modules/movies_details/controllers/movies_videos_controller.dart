import 'package:f_movie_db/data/model/videos/videos_results.dart';
import 'package:f_movie_db/data/services/videos_client.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MoviesVideosController extends GetxController {
  final VideosClient client;
  MoviesVideosController(this.client);

  YoutubePlayerController? videoPlayerController;
  Future getVideo(int videoId) async {
    try {
      client.id = videoId;
      List<VideosResults> videos = await client.getData();
      var video = videos.firstWhere((element) => element.type == 'Trailer');
      videoPlayerController = YoutubePlayerController(
        initialVideoId: video.key!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ),
      );
      return video;
    } catch (e) {
      return null;
    }
  }
}
