import 'dart:math';

import 'package:f_movie_db/core/utils/paddings.dart';
import 'package:f_movie_db/data/model/results.dart';
import 'package:f_movie_db/global_widgets/custom_app_bar.dart';
import 'package:f_movie_db/global_widgets/futuristic.dart';
import 'package:f_movie_db/modules/main_screen/controllers/now_playing_controller.dart';
import 'package:f_movie_db/modules/main_screen/views/movie_item_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPageUi extends StatelessWidget {
  const MainPageUi({super.key});

  @override
  Widget build(BuildContext context) {
    final NowPlayingController nowPlayingController = Get.find();
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Home',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Paddings.allPaddings),
          child: Column(
            children: [
              const Text('Now Playing'),
              Futuristic(
                useQuery: false,
                futureBuilder: () =>
                    nowPlayingController.getDataNowPlayingMovies(),
                dataBuilder: (p0, p1) {
                  return Row(
                    children: [
                      SizedBox(
                        height: 200,
                        width: Get.width - Paddings.allPaddings * 2,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            Results item = p1.data[index];
                            int id = Random().nextInt(50000);
                            return Hero(
                              tag: 'poster${item.id}$id',
                              child: SizedBox(
                                width: 100,
                                child: MovieItemView(
                                  item: item,
                                  id: id,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
              const Text('Popular'),
              Futuristic(
                useQuery: false,
                futureBuilder: () =>
                    nowPlayingController.getDataPopularMovies(),
                dataBuilder: (p0, p1) {
                  return Row(
                    children: [
                      SizedBox(
                        height: 200,
                        width: Get.width - Paddings.allPaddings * 2,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            Results item = p1.data[index];
                            int id = Random().nextInt(50000);
                            return Hero(
                              tag: 'poster${item.id}$id',
                              child: SizedBox(
                                width: 100,
                                child: MovieItemView(
                                  item: item,
                                  id: id,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
              const Text('Upcoming'),
              Futuristic(
                useQuery: false,
                futureBuilder: () =>
                    nowPlayingController.getDataUpcomingMovies(),
                dataBuilder: (p0, p1) {
                  return Row(
                    children: [
                      SizedBox(
                        height: 200,
                        width: Get.width - Paddings.allPaddings * 2,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            Results item = p1.data[index];
                            int id = Random().nextInt(50000);
                            debugPrint(item.id.toString());
                            return Hero(
                              tag: 'poster${item.id}$id',
                              child: SizedBox(
                                width: 100,
                                child: MovieItemView(
                                  item: item,
                                  id: id,
                                ),
                              ),
                            );
                          },
                        ),
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
