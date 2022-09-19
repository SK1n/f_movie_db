import 'package:f_movie_db/core/utils/paddings.dart';
import 'package:f_movie_db/modules/movies_page/controllers/movies_page_controller.dart';
import 'package:f_movie_db/routes/app_routes.dart';
import 'package:f_movie_db/widgets/futuristic.dart';
import 'package:f_movie_db/widgets/carousell_title.dart';
import 'package:f_movie_db/modules/movies_page/views/movies_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    MoviesPageController controller = Get.find();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(Paddings.allPaddings),
        child: Column(
          children: [
            Futuristic(
              futureBuilder: () => controller.getNowPlayingData(),
              dataBuilder: (context, snapshot) {
                return Column(
                  children: [
                    InkWell(
                      onTap: (() => Get.toNamed(Routes.moviesNowPlaying)),
                      child: const CarousellTitle(
                        title: 'NOW PLAYING MOVIES',
                      ),
                    ),
                    MoviesListView(
                      list: snapshot.data,
                      title: 'NOW PLAYING MOVIES',
                    ),
                  ],
                );
              },
            ),
            Futuristic(
              futureBuilder: () => controller.getUpcomingData(),
              dataBuilder: (context, snapshot) {
                return Column(
                  children: [
                    InkWell(
                      onTap: (() => Get.toNamed(Routes.moviesUpcoming)),
                      child: const CarousellTitle(
                        title: 'UPCOMING MOVIES',
                      ),
                    ),
                    MoviesListView(
                      list: snapshot.data,
                      title: 'UPCOMING MOVIES',
                    ),
                  ],
                );
              },
            ),
            Futuristic(
              futureBuilder: () => controller.getPopularData(),
              dataBuilder: (context, snapshot) {
                return Column(
                  children: [
                    InkWell(
                      onTap: (() => Get.toNamed(Routes.moviesPopular)),
                      child: const CarousellTitle(
                        title: 'POPULAR MOVIES',
                      ),
                    ),
                    MoviesListView(
                      list: snapshot.data,
                      title: 'POPULAR MOVIES',
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
