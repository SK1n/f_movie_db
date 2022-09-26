import 'package:f_movie_db/data/model/videos/videos_results.dart';
import 'package:f_movie_db/data/services/videos_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AppBarController extends GetxController {
  final VideosClient client;
  AppBarController(this.client);

  final _biggest = 0.0.obs;
  get biggest => _biggest.value;
  set biggest(value) => _biggest.value = value;

  String createDetailsText(
      String? releaseDate, List<dynamic>? genres, runtime) {
    String details = '';
    details = releaseDate ?? '';
    genres!.isNotEmpty ? details = details : DoNothingAction();
    for (var element in genres) {
      details = '$details • ${element.name}';
    }
    details = details.toUpperCase();
    String time;
    if (runtime == null) {
      time = '';
    } else {
      time = '${runtime}m';
      details = '$details • $time';
    }

    return details;
  }

  YoutubePlayerController? videoPlayerController;
  Future getVideo(int videoId, String endPoint) async {
    try {
      client.id = videoId;
      client.endPoint = endPoint;
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

extension Trim on String {
  String displayOnlyOneDecimal() {
    return substring(0, 3);
  }
}
