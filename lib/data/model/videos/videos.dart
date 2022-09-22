import 'package:f_movie_db/data/model/videos/videos_results.dart';

class MoviesVideos {
  int? id;
  List<VideosResults>? results;

  MoviesVideos({this.id, this.results});

  MoviesVideos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['results'] != null) {
      results = <VideosResults>[];
      json['results'].forEach((v) {
        results!.add(VideosResults.fromJson(v));
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
