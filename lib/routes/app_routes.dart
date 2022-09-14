abstract class Routes {
  static const home = _Paths.home;
  static const nowPlaying = home + _Paths.nowPlaying;
  static const moviesPopular = home + _Paths.moviesPopular;
  static const moviesUpcoming = home + _Paths.moviesUpcoming;
  static const moviePage = _Paths.moviePage;
  static const tvShowsPage = _Paths.tvShowsPage;
}

abstract class _Paths {
  static const home = '/home';
  static const nowPlaying = '/nowPlaying';
  static const moviePage = '/movie';
  static const moviesPopular = '/popular';
  static const moviesUpcoming = '/upcoming';
  static const tvShowsPage = '/tvshows';
}
