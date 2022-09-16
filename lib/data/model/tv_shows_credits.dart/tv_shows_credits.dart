import 'package:f_movie_db/data/model/tv_shows_credits.dart/tv_shows_credits_cast.dart';
import 'package:f_movie_db/data/model/tv_shows_credits.dart/tv_shows_credits_crew.dart';

class TvShowsCredits {
  List<TvShowsCreditsCast>? cast;
  List<TvShowsCreditsCrew>? crew;
  num? id;

  TvShowsCredits({this.cast, this.crew, this.id});

  TvShowsCredits.fromJson(Map<String, dynamic> json) {
    if (json['cast'] != null) {
      cast = <TvShowsCreditsCast>[];
      json['cast'].forEach((v) {
        cast!.add(TvShowsCreditsCast.fromJson(v));
      });
    }
    if (json['crew'] != null) {
      crew = <TvShowsCreditsCrew>[];
      json['crew'].forEach((v) {
        crew!.add(TvShowsCreditsCrew.fromJson(v));
      });
    }
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cast != null) {
      data['cast'] = cast!.map((v) => v.toJson()).toList();
    }
    if (crew != null) {
      data['crew'] = crew!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    return data;
  }
}
