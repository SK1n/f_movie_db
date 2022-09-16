import 'package:f_movie_db/data/model/people_movie_credits.dart/people_movie_credits_cast.dart';
import 'package:f_movie_db/data/model/people_movie_credits.dart/people_movie_credits_crew.dart';

class PeopleMovieCredits {
  List<PeopleMovieCreditsCast>? cast;
  List<PeopleMovieCreditsCrew>? crew;
  num? id;

  PeopleMovieCredits({this.cast, this.crew, this.id});

  PeopleMovieCredits.fromJson(Map<String, dynamic> json) {
    if (json['cast'] != null) {
      cast = <PeopleMovieCreditsCast>[];
      json['cast'].forEach((v) {
        cast!.add(PeopleMovieCreditsCast.fromJson(v));
      });
    }
    if (json['crew'] != null) {
      crew = <PeopleMovieCreditsCrew>[];
      json['crew'].forEach((v) {
        crew!.add(PeopleMovieCreditsCrew.fromJson(v));
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
