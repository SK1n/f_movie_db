import 'package:f_movie_db/data/model/person_movies_credits/person_movies_credits_cast.dart';
import 'package:f_movie_db/data/model/person_movies_credits/person_movies_credits_crew.dart';

class PersonMoviesCredits {
  List<PersonMoviesCreditsCast>? cast;
  List<PersonMoviesCreditsCrew>? crew;
  int? id;

  PersonMoviesCredits({this.cast, this.crew, this.id});

  PersonMoviesCredits.fromJson(Map<String, dynamic> json) {
    if (json['cast'] != null) {
      cast = <PersonMoviesCreditsCast>[];
      json['cast'].forEach((v) {
        cast!.add(PersonMoviesCreditsCast.fromJson(v));
      });
    }
    if (json['crew'] != null) {
      crew = <PersonMoviesCreditsCrew>[];
      json['crew'].forEach((v) {
        crew!.add(PersonMoviesCreditsCrew.fromJson(v));
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
