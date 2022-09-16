import 'package:f_movie_db/data/model/movie_credits/movie_credits_cast.dart';
import 'package:f_movie_db/data/model/movie_credits/movie_credits_crew.dart';

class MovieCredits {
  num? id;
  List<MovieCreditsCast>? cast;
  List<MovieCreditsCrew>? crew;

  MovieCredits({this.id, this.cast, this.crew});

  MovieCredits.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['cast'] != null) {
      cast = <MovieCreditsCast>[];
      json['cast'].forEach((v) {
        cast!.add(MovieCreditsCast.fromJson(v));
      });
    }
    if (json['crew'] != null) {
      crew = <MovieCreditsCrew>[];
      json['crew'].forEach((v) {
        crew!.add(MovieCreditsCrew.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (cast != null) {
      data['cast'] = cast!.map((v) => v.toJson()).toList();
    }
    if (crew != null) {
      data['crew'] = crew!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
