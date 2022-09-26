import 'package:f_movie_db/modules/movies_page/bindings/movies_page_bindings.dart';
import 'package:f_movie_db/modules/person_details/bindings/person_details_bindings.dart';
import 'package:f_movie_db/modules/person_details/bindings/person_movies_credits_bindings.dart';
import 'package:f_movie_db/modules/person_details/bindings/person_tv_shows_credits_bindings.dart';
import 'package:f_movie_db/modules/person_details/views/person_details_page.dart';
import 'package:f_movie_db/modules/tv_shows_page/bindings/tv_shows_bindings.dart';
import 'package:f_movie_db/modules/main_screen/views/main_page_view.dart';
import 'package:f_movie_db/modules/movies_details/bindings/movie_page_bindings.dart';
import 'package:f_movie_db/modules/movies_details/views/movie_page_view.dart';
import 'package:f_movie_db/modules/movies_now_playing/bindings/movies_now_playing_bindings.dart';
import 'package:f_movie_db/modules/movies_now_playing/views/movies_now_playing_view.dart';
import 'package:f_movie_db/modules/movies_popular/bindings/movies_popular_bindings.dart';
import 'package:f_movie_db/modules/movies_popular/views/movies_popular_view.dart';
import 'package:f_movie_db/modules/movies_upcoming/bindings/movies_upcoming_bindings.dart';
import 'package:f_movie_db/modules/movies_upcoming/views/movies_upcoming_view.dart';
import 'package:f_movie_db/modules/root/views/root_view.dart';
import 'package:f_movie_db/modules/tv_shows_details/bindings/tv_shows_details_bindings.dart';
import 'package:f_movie_db/modules/tv_shows_details/views/tv_shows_details_page.dart';
import 'package:f_movie_db/modules/tv_shows_season_details/bindings/tv_shows_season_details_bindings.dart';
import 'package:f_movie_db/modules/tv_shows_season_details/views/tv_shows_season_details_view.dart';
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
            MoviesPageBinding(),
            BottomNavigationBarBinding(),
            TvShowsPageBinding(),
          ],
        ),
        GetPage(
          name: Routes.moviesDetails,
          page: () => const MoviePageView(),
          bindings: [
            MoviePageBindings(),
          ],
        ),
        GetPage(
          name: Routes.moviesNowPlaying,
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
          name: Routes.tvShowsDetails,
          page: () => const TvShowsDetailsPage(),
          binding: TvShowsDetailsBinding(),
        ),
        GetPage(
          name: Routes.personDetails,
          page: () => const PersonDetailsPage(),
          bindings: [
            PersonDetailsBinding(),
            PersonMoviesCreditsBinding(),
            PersonTvShowsCreditsBinding(),
          ],
        ),
        GetPage(
          name: Routes.tvShowsSeasonDetails,
          page: () => const TvShowsSeasonDetailsView(),
          bindings: [
            TvShowsSeasonDetailsBinding(),
          ],
        ),
      ],
    )
  ];
}
