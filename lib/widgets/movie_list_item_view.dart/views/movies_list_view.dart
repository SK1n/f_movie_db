import 'dart:math';

import 'package:f_movie_db/core/utils/paddings.dart';
import 'package:f_movie_db/data/model/movies_results.dart';
import 'package:f_movie_db/widgets/movie_list_item_view.dart/views/movie_item_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesListView extends StatelessWidget {
  final List<MoviesResults> list;
  final String title;
  const MoviesListView({
    super.key,
    required this.list,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          thickness: 1.0,
          height: 10,
        ),
        SizedBox(
          height: 200,
          width: Get.width - Paddings.allPaddings * 2,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index) {
              MoviesResults item = list[index];
              String posterId = '${item.id}${Random().nextInt(500000)}';
              return Hero(
                tag: posterId,
                child: SizedBox(
                  width: 100,
                  child: MovieItemView(
                    posterId: posterId,
                    item: item,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
