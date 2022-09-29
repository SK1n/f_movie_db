import 'package:f_movie_db/data/model/movies/movies_dates.dart';
import 'package:f_movie_db/data/model/movies/movies_results.dart';

class Movies {
  MoviesDates? dates;
  int? page;
  List<MoviesResults>? results;
  int? totalPages;
  int? totalResults;

  Movies(
      {this.dates,
      this.page,
      this.results,
      this.totalPages,
      this.totalResults});

  Movies.fromJson(Map<String, dynamic> json) {
    dates = json['dates'] != null ? MoviesDates.fromJson(json['dates']) : null;
    page = json['page'];
    if (json['results'] != null) {
      results = <MoviesResults>[];
      json['results'].forEach((v) {
        results!.add(MoviesResults.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dates != null) {
      data['dates'] = dates!.toJson();
    }
    data['page'] = page;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}
