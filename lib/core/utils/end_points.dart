class EndPoints {
  final int? id;
  EndPoints({this.id});
  String get moviesPopular => 'movie/popular';
  String get moviesUpcoming => 'movie/upcoming';
  String get moviesNowPlaying => 'movie/now_playing';
  String get moviesCredits => 'movie/$id/credits';
  String get tvShowsOnTheAir => 'tv/on_the_air';
  String get tvShowsPopular => 'tv/popular';
  String get tvShowsTopRated => 'tv/top_rated';
  String get tvShowsVideo => 'tv/$id/videos';
}
