import 'dart:math';

import 'package:f_movie_db/modules/movies_now_playing/controllers/movies_now_playing_controller.dart';
import 'package:f_movie_db/modules/movies_now_playing/views/movies_popular_item.dart';
import 'package:f_movie_db/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pagination_view/pagination_view.dart';

class MoviesNowPlayingView extends StatelessWidget {
  const MoviesNowPlayingView({super.key});

  @override
  Widget build(BuildContext context) {
    MoviesNowPlayingController controller = Get.find();
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Now Playing Movies',
      ),
      body: PaginationView(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        paginationViewType: PaginationViewType.gridView,
        pullToRefresh: true,
        itemBuilder: ((context, item, index) {
          String posterId = '${item.id}${Random().nextInt(500000)}';
          return MoviesNowPlayingItem(posterId: posterId, item: item);
        }),
        pageFetch: (currentListSize) => controller.getData(currentListSize),
        onEmpty: Container(),
        onError: (dynamic error) => Container(),
      ),
    );
  }
}
