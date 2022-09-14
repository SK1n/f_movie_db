import 'package:dio/dio.dart';
import 'package:f_movie_db/core/utils/base_url.dart';
import 'package:f_movie_db/core/utils/end_points.dart';
import 'package:f_movie_db/data/model/cast.dart';
import 'package:f_movie_db/data/model/crew.dart';
import 'package:f_movie_db/data/model/video_results.dart';
import 'package:f_movie_db/data/services/cast_client.dart';
import 'package:f_movie_db/data/services/crew_client.dart';
import 'package:f_movie_db/data/services/video_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TvShowsPersonItemController extends GetxController {
  final _crew = <Crew>[].obs;
  get crew => _crew;
  set crew(value) => _crew.value = value;

  final _cast = <Cast>[].obs;
  get cast => _cast;
  set cast(value) => _cast.value = value;

  final _video = <VideoResults>[].obs;
  get video => _video;
  set video(value) => _video.value = value;

  YoutubePlayerController? videoPlayerController;

  getVideo(String url) async {
    var dio = Dio();
    var tempVideos = VideoClient(httpClient: dio, endPoint: url);
    var videos = await tempVideos.getAll();
    videos != null ? video.addAll(videos) : DoNothingAction();
    debugPrint('https://www.youtube.com/watch?v=${video[0].key}');
    videoPlayerController = YoutubePlayerController(
        initialVideoId: video[0].key,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ));
    videoPlayerController!.load(video[0].key);
  }

  getData(movieId) async {
    var dio = Dio();
    var tempCrew = CrewClient(
      httpClient: dio,
      endPoint: EndPoints(id: movieId).moviesCredits,
    );
    var tempCast = CastClient(
      httpClient: dio,
      endPoint: EndPoints(id: movieId).moviesCredits,
    );

    var crewData = await tempCrew.getAll();
    var castData = await tempCast.getAll();
    crewData != null ? crew.addAll(crewData) : DoNothingAction();
    castData != null ? cast.addAll(castData) : DoNothingAction();
  }

  int get lengthCrew => crew.length;
  int get lengthCast => cast.length;
}