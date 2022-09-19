abstract class Routes {
  static const home = _Paths.home;
  static const moviesNowPlaying = home + _Paths.moviesNowPlaying;
  static const moviesPopular = home + _Paths.moviesPopular;
  static const moviesUpcoming = home + _Paths.moviesUpcoming;
  static const moviesDetails = _Paths.moviesDetails;
  static const tvShowsDetails = _Paths.tvShowsDetails;
  static const personDetails = _Paths.personDetails;
}

abstract class _Paths {
  static const home = '/home';
  static const moviesNowPlaying = '/nowPlaying';
  static const moviesPopular = '/popular';
  static const moviesUpcoming = '/upcoming';
  static const moviesDetails = '/moviesDetails';
  static const tvShowsDetails = '/tvShowsDetails';
  static const personDetails = '/personDetails';
}
