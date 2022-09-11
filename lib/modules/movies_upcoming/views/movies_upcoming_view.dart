import 'dart:math';

import 'package:f_movie_db/modules/movies_upcoming/controllers/movies_upcoming_controller.dart';
import 'package:f_movie_db/widgets/custom_app_bar.dart';
import 'package:f_movie_db/widgets/movie_item_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pagination_view/pagination_view.dart';

class MoviesUpcomingView extends StatelessWidget {
  const MoviesUpcomingView({super.key});

  @override
  Widget build(BuildContext context) {
    MoviesUpcomingController controller = Get.find();
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Upcoming Movies',
      ),
      body: PaginationView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          paginationViewType: PaginationViewType.gridView,
          pullToRefresh: true,
          itemBuilder: ((context, item, index) {
            int id = Random().nextInt(50000);
            return MovieItemView(item: item, id: id);
          }),
          pageFetch: (currentListSize) => controller.getData(currentListSize),
          onEmpty: Container(),
          onError: (dynamic error) => Container()),
    );
  }
}
