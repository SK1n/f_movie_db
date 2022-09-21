class EndPoints {
  final int? id;
  EndPoints({this.id});
  String get movieDetails => 'movie/$id';
  String get moviesPopular => 'movie/popular';
  String get moviesUpcoming => 'movie/upcoming';
  String get moviesNowPlaying => 'movie/now_playing';
  String get moviesCredits => 'movie/$id/credits';
  String get moviesVideosResults => 'movie/$id/videos';
  String get tvShowsOnTheAir => 'tv/on_the_air';
  String get tvShowsPopular => 'tv/popular';
  String get tvShowsTopRated => 'tv/top_rated';
  String get tvShowsVideo => 'tv/$id/videos';
  String get tvShowsDetails => 'tv/$id';
  String get tvShowsCredits => 'tv/$id/credits';
  String get personDetails => 'person/$id';
  String get personMoviesCredits => 'person/$id/movie_credits';
  String get personTvShowsCredits => '/person/$id/tv_credits';
}
