import 'package:f_movie_db/data/model/person_tv_shows_credits/person_tv_shows_credits_cast.dart';
import 'package:f_movie_db/data/model/person_tv_shows_credits/person_tv_shows_credits_crew.dart';

class PersonTvShowsCredits {
  List<PersonTvShowsCreditsCast>? cast;
  List<PersonTvShowsCreditsCrew>? crew;
  int? id;

  PersonTvShowsCredits({this.cast, this.crew, this.id});

  PersonTvShowsCredits.fromJson(Map<String, dynamic> json) {
    if (json['cast'] != null) {
      cast = <PersonTvShowsCreditsCast>[];
      json['cast'].forEach((v) {
        cast!.add(PersonTvShowsCreditsCast.fromJson(v));
      });
    }
    if (json['crew'] != null) {
      crew = <PersonTvShowsCreditsCrew>[];
      json['crew'].forEach((v) {
        crew!.add(PersonTvShowsCreditsCrew.fromJson(v));
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
