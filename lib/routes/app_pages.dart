import 'package:f_movie_db/main.dart';
import 'package:f_movie_db/modules/main_screen/views/main_page_view.dart';
import 'package:f_movie_db/modules/now_playing.dart/views/now_playing_view.dart';
import 'package:f_movie_db/modules/root/views/root_view.dart';
import 'package:f_movie_db/routes/app_routes.dart';
import 'package:get/get.dart';

abstract class AppPages {
  AppPages._();

  static const INITIAL = Routes.home;

  static final pages = [
    GetPage(name: '/', page: () => const RootView(), children: [
      GetPage(name: Routes.home, page: () => const MainPageUi(), children: [
        GetPage(name: Routes.nowPlaying, page: () => const NowPlayingView()),
      ]),
    ])
  ];
}
