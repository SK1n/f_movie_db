import 'package:f_movie_db/data/model/movie_details/movie_details_belongs_to_collection.dart';
import 'package:f_movie_db/data/model/movie_details/movie_details_genres.dart';
import 'package:f_movie_db/data/model/movie_details/movie_details_production_companies.dart';
import 'package:f_movie_db/data/model/movie_details/movie_details_production_countries.dart';
import 'package:f_movie_db/data/model/movie_details/movie_details_spoken_languages.dart';

class MovieDetails {
  bool? adult;
  String? backdropPath;
  MovieDetailsBelongsToCollection? belongsToCollection;
  num? budget;
  List<MovieDetailsGenres>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  num? popularity;
  String? posterPath;
  List<MovieDetailsProductionCompanies>? productionCompanies;
  List<MovieDetailsProductionCountries>? productionCountries;
  String? releaseDate;
  num? revenue;
  num? runtime;
  List<MovieDetailsSpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  num? voteAverage;
  num? voteCount;

  MovieDetails(
      {this.adult,
      this.backdropPath,
      this.belongsToCollection,
      this.budget,
      this.genres,
      this.homepage,
      this.id,
      this.imdbId,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.productionCompanies,
      this.productionCountries,
      this.releaseDate,
      this.revenue,
      this.runtime,
      this.spokenLanguages,
      this.status,
      this.tagline,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  MovieDetails.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    belongsToCollection = json['belongs_to_collection'] != null
        ? MovieDetailsBelongsToCollection.fromJson(
            json['belongs_to_collection'])
        : null;
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = <MovieDetailsGenres>[];
      json['genres'].forEach((v) {
        genres!.add(MovieDetailsGenres.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      productionCompanies = <MovieDetailsProductionCompanies>[];
      json['production_companies'].forEach((v) {
        productionCompanies!.add(MovieDetailsProductionCompanies.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      productionCountries = <MovieDetailsProductionCountries>[];
      json['production_countries'].forEach((v) {
        productionCountries!.add(MovieDetailsProductionCountries.fromJson(v));
      });
    }
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    if (json['spoken_languages'] != null) {
      spokenLanguages = <MovieDetailsSpokenLanguages>[];
      json['spoken_languages'].forEach((v) {
        spokenLanguages!.add(MovieDetailsSpokenLanguages.fromJson(v));
      });
    }
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    if (belongsToCollection != null) {
      data['belongs_to_collection'] = belongsToCollection!.toJson();
    }
    data['budget'] = budget;
    if (genres != null) {
      data['genres'] = genres!.map((v) => v.toJson()).toList();
    }
    data['homepage'] = homepage;
    data['id'] = id;
    data['imdb_id'] = imdbId;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
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
    data['release_date'] = releaseDate;
    data['revenue'] = revenue;
    data['runtime'] = runtime;
    if (spokenLanguages != null) {
      data['spoken_languages'] =
          spokenLanguages!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['tagline'] = tagline;
    data['title'] = title;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
}
