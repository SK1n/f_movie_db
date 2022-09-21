import 'package:f_movie_db/data/model/movies_videos/movies_videos_results.dart';
import 'package:f_movie_db/data/services/movies_videos_controller.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MoviesVideosController extends GetxController {
  final MoviesVideosClient client;
  MoviesVideosController(this.client);

  YoutubePlayerController? videoPlayerController;
  Future getVideo(int videoId) async {
    client.id = videoId;
    List<MoviesVideosResults> videos = await client.getData();
    var video = videos.firstWhere((element) => element.type == 'Trailer');
    videoPlayerController = YoutubePlayerController(
      initialVideoId: video.key!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
    return video;
  }
}
