import 'package:f_movie_db/data/model/credits_movies_cast.dart';
import 'package:f_movie_db/data/model/credits_movies_crew.dart';

class MoviesCredits {
  List<CreditsMoviesCast>? cast;
  List<CreditsMoviesCrew>? crew;
  int? id;

  MoviesCredits({this.cast, this.crew, this.id});

  MoviesCredits.fromJson(Map<String, dynamic> json) {
    if (json['cast'] != null) {
      cast = <CreditsMoviesCast>[];
      json['cast'].forEach((v) {
        cast!.add(CreditsMoviesCast.fromJson(v));
      });
    }
    if (json['crew'] != null) {
      crew = <CreditsMoviesCrew>[];
      json['crew'].forEach((v) {
        crew!.add(CreditsMoviesCrew.fromJson(v));
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
