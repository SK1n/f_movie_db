import 'package:f_movie_db/modules/credits/bindings/credits_bindings.dart';
import 'package:f_movie_db/modules/credits/views/credits_view.dart';
import 'package:f_movie_db/modules/main_screen/bindings/movies_bindings.dart';
import 'package:f_movie_db/modules/main_screen/bindings/tv_shows_bindings.dart';
import 'package:f_movie_db/modules/main_screen/views/main_page_view.dart';
import 'package:f_movie_db/modules/movie_page/bindings/movie_page_bindings.dart';
import 'package:f_movie_db/modules/movie_page/views/movie_page_view.dart';
import 'package:f_movie_db/modules/movies_now_playing/bindings/movies_now_playing_bindings.dart';
import 'package:f_movie_db/modules/movies_now_playing/views/movies_now_playing_view.dart';
import 'package:f_movie_db/modules/movies_popular/bindings/movies_popular_bindings.dart';
import 'package:f_movie_db/modules/movies_popular/views/movies_popular_view.dart';
import 'package:f_movie_db/modules/movies_upcoming/bindings/movies_upcoming_bindings.dart';
import 'package:f_movie_db/modules/movies_upcoming/views/movies_upcoming_view.dart';
import 'package:f_movie_db/modules/root/views/root_view.dart';
import 'package:f_movie_db/modules/tv_show_page/bindings/tv_shows_page_bindings.dart';
import 'package:f_movie_db/modules/tv_show_page/views/tv_shows_page_view.dart';
import 'package:f_movie_db/routes/app_routes.dart';
import 'package:f_movie_db/widgets/bottom_navigation_bar/bindings/bottom_navigation_bar_bindings.dart';
import 'package:get/get.dart';

abstract class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.home;

  static final pages = [
    GetPage(
      name: '/',
      page: () => const RootView(),
      children: [
        GetPage(
          name: Routes.home,
          page: () => const MainPageUi(),
          bindings: [
            MoviesBinding(),
            TvShowsBinding(),
            BottomNavigationBarBinding(),
          ],
        ),
        GetPage(
          name: Routes.moviePage,
          page: () => const MoviePageView(),
          bindings: [
            MoviePageBindings(),
          ],
        ),
        GetPage(
          name: Routes.nowPlaying,
          page: () => const MoviesNowPlayingView(),
          binding: MoviesNowPlayingBinding(),
        ),
        GetPage(
          name: Routes.moviesPopular,
          page: () => const MoviesPopularView(),
          binding: MoviesPopularBinding(),
        ),
        GetPage(
          name: Routes.moviesUpcoming,
          page: () => const MoviesUpcomingView(),
          binding: MoviesUpcomingBinding(),
        ),
        GetPage(
          name: Routes.tvShowsPage,
          page: () => const TvShowsItemPageUI(),
          binding: TvShowsPageBinding(),
        ),
        GetPage(
            name: Routes.credits,
            page: () => const CreditsView(),
            binding: CreditsBinding()),
      ],
    )
  ];
}
