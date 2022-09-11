class EndPoints {
  final int? id;
  EndPoints({this.id});
  String get moviesPopular => 'movie/popular';
  String get moviesUpcoming => 'movie/upcoming';
  String get moviesNowPlaying => 'movie/now_playing';
  String get moviesCredits => 'movie/$id/credits';
}
