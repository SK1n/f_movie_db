import 'package:f_movie_db/data/model/tv_shows_results.dart';

class TvShows {
  int? page;
  List<TvShowsResults>? results;
  int? totalPages;
  int? totalResults;

  TvShows({this.page, this.results, this.totalPages, this.totalResults});

  TvShows.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <TvShowsResults>[];
      json['results'].forEach((v) {
        results!.add(TvShowsResults.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}
