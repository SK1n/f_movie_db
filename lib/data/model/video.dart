import 'package:f_movie_db/data/model/video_results.dart';

class Video {
  int? id;
  List<VideoResults>? results;

  Video({this.id, this.results});

  Video.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['results'] != null) {
      results = <VideoResults>[];
      json['results'].forEach((v) {
        results!.add(VideoResults.fromJson(v));
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
