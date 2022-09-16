import 'dart:math';

import 'package:f_movie_db/core/utils/paddings.dart';
import 'package:f_movie_db/data/model/tv_shows_results.dart';
import 'package:f_movie_db/widgets/tv_shows_item_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TvShowsListView extends StatelessWidget {
  final List<TvShowsResults> list;
  final String title;
  const TvShowsListView({
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
              TvShowsResults item = list[index];
              int id = Random().nextInt(50000);
              String posterId = '${item.id}${Random().nextInt(50000)}';
              return Hero(
                tag: 'poster${item.id}$id',
                child: SizedBox(
                  width: 100,
                  child: TvShowsItemView(
                    item: item,
                    posterId: posterId,
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
