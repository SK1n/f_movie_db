import 'package:f_movie_db/modules/main_screen/bindings/now_playing_bindings.dart';
import 'package:f_movie_db/modules/main_screen/views/main_page_view.dart';
import 'package:f_movie_db/modules/movie/views/movie_item_page_view.dart';
import 'package:f_movie_db/modules/now_playing.dart/views/now_playing_view.dart';
import 'package:f_movie_db/modules/root/views/root_view.dart';
import 'package:f_movie_db/routes/app_routes.dart';
import 'package:get/get.dart';

abstract class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.home;

  static final pages = [
    GetPage(name: '/', page: () => const RootView(), children: [
      GetPage(name: Routes.home, page: () => const MainPageUi(), bindings: [
        NowPlayingBinding()
      ], children: [
        GetPage(name: Routes.nowPlaying, page: () => const NowPlayingView()),
      ]),
      GetPage(name: Routes.moviePage, page: () => const MovieItemPageView()),
    ])
  ];
}
