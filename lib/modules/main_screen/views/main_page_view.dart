import 'package:auto_size_text/auto_size_text.dart';
import 'package:f_movie_db/core/utils/paddings.dart';
import 'package:f_movie_db/modules/main_screen/controllers/main_page_controller.dart';
import 'package:f_movie_db/routes/app_routes.dart';
import 'package:f_movie_db/widgets/custom_app_bar.dart';
import 'package:f_movie_db/widgets/futuristic.dart';
import 'package:f_movie_db/widgets/movies_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPageUi extends StatelessWidget {
  const MainPageUi({super.key});

  @override
  Widget build(BuildContext context) {
    MainPageController controller = Get.find();
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Home',
      ),
      body: SingleChildScrollView(
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
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: Paddings.topPaddings,
                                  bottom: Paddings.bottomPaddings),
                              child: Card(
                                child: Container(
                                  width: Get.width,
                                  margin: const EdgeInsets.all(
                                      Paddings.allPaddings),
                                  child: const AutoSizeText(
                                    'NOW PLAYING MOVIES',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  right: Paddings.rightPaddings),
                              child: const Icon(Icons.arrow_forward_sharp),
                            )
                          ],
                        ),
                      ),
                      MoviesListView(
                        list: controller.nowPlaying,
                        title: 'NOW PLAYING MOVIES',
                      ),
                      InkWell(
                        onTap: (() => Get.toNamed(Routes.moviesUpcoming)),
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: Paddings.topPaddings,
                                  bottom: Paddings.bottomPaddings),
                              child: Card(
                                child: Container(
                                  width: Get.width,
                                  margin: const EdgeInsets.all(
                                      Paddings.allPaddings),
                                  child: const AutoSizeText(
                                    'UPCOMING MOVIES',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  right: Paddings.rightPaddings),
                              child: const Icon(Icons.arrow_forward_sharp),
                            )
                          ],
                        ),
                      ),
                      MoviesListView(
                        list: controller.upcoming,
                        title: 'UPCOMING MOVIES',
                      ),
                      InkWell(
                        onTap: (() => Get.toNamed(Routes.moviesPopular)),
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: Paddings.topPaddings,
                                  bottom: Paddings.bottomPaddings),
                              child: Card(
                                child: Container(
                                  width: Get.width,
                                  margin: const EdgeInsets.all(
                                      Paddings.allPaddings),
                                  child: const AutoSizeText(
                                    'POPULAR MOVIES',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  right: Paddings.rightPaddings),
                              child: const Icon(Icons.arrow_forward_sharp),
                            )
                          ],
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
      ),
    );
  }
}
