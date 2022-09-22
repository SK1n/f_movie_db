import 'package:f_movie_db/data/model/tv_shows_details/tv_shows_details_created_by.dart';
import 'package:f_movie_db/data/model/tv_shows_details/tv_shows_details_genre.dart';
import 'package:f_movie_db/data/model/tv_shows_details/tv_shows_details_last_episode_to_air.dart';
import 'package:f_movie_db/data/model/tv_shows_details/tv_shows_details_networks.dart';
import 'package:f_movie_db/data/model/tv_shows_details/tv_shows_details_next_episode_to_air.dart';
import 'package:f_movie_db/data/model/tv_shows_details/tv_shows_details_production_companies.dart';
import 'package:f_movie_db/data/model/tv_shows_details/tv_shows_details_production_countries.dart';
import 'package:f_movie_db/data/model/tv_shows_details/tv_shows_details_seasons.dart';
import 'package:f_movie_db/data/model/tv_shows_details/tv_shows_details_spoken_languages.dart';

class TvShowsDetails {
  bool? adult;
  String? backdropPath;
  List<TvShowsDetailsCreatedBy>? createdBy;
  List<num>? episodeRunTime;
  String? firstAirDate;
  List<TvShowsDetailsGenres>? genres;
  String? homepage;
  int? id;
  bool? inProduction;
  List<String>? languages;
  String? lastAirDate;
  TvShowsDetailsLastEpisodeToAir? lastEpisodeToAir;
  String? name;
  TvShowsDetailsNextEpisodeToAir? nextEpisodeToAir;
  List<TvShowsDetailsNetworks>? networks;
  num? numberOfEpisodes;
  num? numberOfSeasons;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  num? popularity;
  String? posterPath;
  List<TvShowsDetailsProductionCompanies>? productionCompanies;
  List<TvShowsDetailsProductionCountries>? productionCountries;
  List<TvShowsDetailsSeasons>? seasons;
  List<TvShowsDetailsSpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  String? type;
  num? voteAverage;
  num? voteCount;

  TvShowsDetails(
      {this.adult,
      this.backdropPath,
      this.createdBy,
      this.episodeRunTime,
      this.firstAirDate,
      this.genres,
      this.homepage,
      this.id,
      this.inProduction,
      this.languages,
      this.lastAirDate,
      this.lastEpisodeToAir,
      this.name,
      this.nextEpisodeToAir,
      this.networks,
      this.numberOfEpisodes,
      this.numberOfSeasons,
      this.originCountry,
      this.originalLanguage,
      this.originalName,
      this.overview,
      this.popularity,
      this.posterPath,
      this.productionCompanies,
      this.productionCountries,
      this.seasons,
      this.spokenLanguages,
      this.status,
      this.tagline,
      this.type,
      this.voteAverage,
      this.voteCount});

  TvShowsDetails.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    if (json['created_by'] != null) {
      createdBy = <TvShowsDetailsCreatedBy>[];
      json['created_by'].forEach((v) {
        createdBy!.add(TvShowsDetailsCreatedBy.fromJson(v));
      });
    }
    episodeRunTime = json['episode_run_time'].cast<num>();
    firstAirDate = json['first_air_date'];
    if (json['genres'] != null) {
      genres = <TvShowsDetailsGenres>[];
      json['genres'].forEach((v) {
        genres!.add(TvShowsDetailsGenres.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    inProduction = json['in_production'];
    languages = json['languages'].cast<String>();
    lastAirDate = json['last_air_date'];
    lastEpisodeToAir = json['last_episode_to_air'] != null
        ? TvShowsDetailsLastEpisodeToAir.fromJson(json['last_episode_to_air'])
        : null;
    name = json['name'];
    nextEpisodeToAir = json['next_episode_to_air'] != null
        ? TvShowsDetailsNextEpisodeToAir.fromJson(json['next_episode_to_air'])
        : null;
    if (json['networks'] != null) {
      networks = <TvShowsDetailsNetworks>[];
      json['networks'].forEach((v) {
        networks!.add(TvShowsDetailsNetworks.fromJson(v));
      });
    }
    numberOfEpisodes = json['number_of_episodes'];
    numberOfSeasons = json['number_of_seasons'];
    originCountry = json['origin_country'].cast<String>();
    originalLanguage = json['original_language'];
    originalName = json['original_name'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      productionCompanies = <TvShowsDetailsProductionCompanies>[];
      json['production_companies'].forEach((v) {
        productionCompanies!.add(TvShowsDetailsProductionCompanies.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      productionCountries = <TvShowsDetailsProductionCountries>[];
      json['production_countries'].forEach((v) {
        productionCountries!.add(TvShowsDetailsProductionCountries.fromJson(v));
      });
    }
    if (json['seasons'] != null) {
      seasons = <TvShowsDetailsSeasons>[];
      json['seasons'].forEach((v) {
        seasons!.add(TvShowsDetailsSeasons.fromJson(v));
      });
    }
    if (json['spoken_languages'] != null) {
      spokenLanguages = <TvShowsDetailsSpokenLanguages>[];
      json['spoken_languages'].forEach((v) {
        spokenLanguages!.add(TvShowsDetailsSpokenLanguages.fromJson(v));
      });
    }
    status = json['status'];
    tagline = json['tagline'];
    type = json['type'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    if (createdBy != null) {
      data['created_by'] = createdBy!.map((v) => v.toJson()).toList();
    }
    data['episode_run_time'] = episodeRunTime;
    data['first_air_date'] = firstAirDate;
    if (genres != null) {
      data['genres'] = genres!.map((v) => v.toJson()).toList();
    }
    data['homepage'] = homepage;
    data['id'] = id;
    data['in_production'] = inProduction;
    data['languages'] = languages;
    data['last_air_date'] = lastAirDate;
    if (lastEpisodeToAir != null) {
      data['last_episode_to_air'] = lastEpisodeToAir!.toJson();
    }
    data['name'] = name;
    if (nextEpisodeToAir != null) {
      data['next_episode_to_air'] = nextEpisodeToAir!.toJson();
    }
    if (networks != null) {
      data['networks'] = networks!.map((v) => v.toJson()).toList();
    }
    data['number_of_episodes'] = numberOfEpisodes;
    data['number_of_seasons'] = numberOfSeasons;
    data['origin_country'] = originCountry;
    data['original_language'] = originalLanguage;
    data['original_name'] = originalName;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = posterPath;
    if (productionCompanies != null) {
      data['production_companies'] =
          productionCompanies!.map((v) => v.toJson()).toList();
    }
    if (productionCountries != null) {
      data['production_countries'] =
          productionCountries!.map((v) => v.toJson()).toList();
    }
    if (seasons != null) {
      data['seasons'] = seasons!.map((v) => v.toJson()).toList();
    }
    if (spokenLanguages != null) {
      data['spoken_languages'] =
          spokenLanguages!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['tagline'] = tagline;
    data['type'] = type;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
}
