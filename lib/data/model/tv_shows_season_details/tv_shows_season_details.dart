import 'package:f_movie_db/data/model/tv_shows_season_details/tv_shows_season_episodes.dart';

class TvShowsSeasonDetails {
  String? sId;
  String? airDate;
  List<TvShowsSeasonEpisodes>? episodes;
  String? name;
  String? overview;
  int? id;
  String? posterPath;
  int? seasonNumber;

  TvShowsSeasonDetails(
      {this.sId,
      this.airDate,
      this.episodes,
      this.name,
      this.overview,
      this.id,
      this.posterPath,
      this.seasonNumber});

  TvShowsSeasonDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    airDate = json['air_date'];
    if (json['episodes'] != null) {
      episodes = <TvShowsSeasonEpisodes>[];
      json['episodes'].forEach((v) {
        episodes!.add(TvShowsSeasonEpisodes.fromJson(v));
      });
    }
    name = json['name'];
    overview = json['overview'];
    id = json['id'];
    posterPath = json['poster_path'];
    seasonNumber = json['season_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['air_date'] = airDate;
    if (episodes != null) {
      data['episodes'] = episodes!.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    data['overview'] = overview;
    data['id'] = id;
    data['poster_path'] = posterPath;
    data['season_number'] = seasonNumber;
    return data;
  }
}
