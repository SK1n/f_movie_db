import 'package:f_movie_db/data/model/movies_videos/movies_videos_results.dart';

class MoviesVideos {
  int? id;
  List<MoviesVideosResults>? results;

  MoviesVideos({this.id, this.results});

  MoviesVideos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['results'] != null) {
      results = <MoviesVideosResults>[];
      json['results'].forEach((v) {
        results!.add(MoviesVideosResults.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
