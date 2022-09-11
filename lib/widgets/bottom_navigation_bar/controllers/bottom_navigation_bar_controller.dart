import 'package:f_movie_db/modules/main_screen/views/movies_page_view.dart';
import 'package:f_movie_db/modules/main_screen/views/tv_shows_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BottomNavigationBarController extends GetxController {
  List<Widget> tabs = const [MoviesPageView(), TvShowsPageView()];

  final _position = 0.obs;
  get position => _position.value;
  set position(value) => _position.value = value;

  Widget get page => tabs[position];

  String getTitle(String title) {
    if (title.isEmpty) {
      switch (position) {
        case 0:
          return 'Movies';

        case 1:
          return 'Tv Shows';
        default:
          return 'Home';
      }
    } else {
      return title;
    }
  }
}
