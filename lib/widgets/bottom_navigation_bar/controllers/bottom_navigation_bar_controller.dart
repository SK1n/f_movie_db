import 'package:f_movie_db/modules/movies_page/views/movies_page.dart';
import 'package:f_movie_db/modules/tv_shows_page/views/tv_shows_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BottomNavigationBarController extends GetxController {
  List<Widget> tabs = const [MoviesPage(), TvShowsPage()];

  final _position = 0.obs;
  get position => _position.value;
  set position(value) => _position.value = value;

  Widget get page => tabs[position];

  String getTitle(title) {
    if (title == null) {
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
