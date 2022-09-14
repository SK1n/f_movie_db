import 'package:f_movie_db/core/utils/paddings.dart';
import 'package:f_movie_db/modules/main_screen/controllers/movies_controller.dart';
import 'package:f_movie_db/routes/app_routes.dart';
import 'package:f_movie_db/widgets/futuristic.dart';
import 'package:f_movie_db/widgets/carousell_title.dart';
import 'package:f_movie_db/widgets/movies_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class MoviesPageView extends StatelessWidget {
  const MoviesPageView({super.key});

  @override
  Widget build(BuildContext context) {
    MoviesController controller = Get.find();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(Paddings.allPaddings),
        child: Column(
          children: [
            Futuristic(
              useQuery: false,
              futureBuilder: () => controller.getData(),
              dataBuilder: (p0, p1) {
                return Column(
                  children: [
                    InkWell(
                      onTap: (() => Get.toNamed(Routes.nowPlaying)),
                      child: const CarousellTitle(
                        title: 'NOW PLAYING MOVIES',
                      ),
                    ),
                    MoviesListView(
                      list: controller.nowPlaying,
                      title: 'NOW PLAYING MOVIES',
                    ),
                    InkWell(
                      onTap: (() => Get.toNamed(Routes.moviesUpcoming)),
                      child: const CarousellTitle(
                        title: 'UPCOMING MOVIES',
                      ),
                    ),
                    MoviesListView(
                      list: controller.upcoming,
                      title: 'UPCOMING MOVIES',
                    ),
                    InkWell(
                      onTap: (() => Get.toNamed(Routes.moviesPopular)),
                      child: const CarousellTitle(
                        title: 'POPULAR MOVIES',
                      ),
                    ),
                    MoviesListView(
                      list: controller.popular,
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
