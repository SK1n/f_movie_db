import 'dart:math';

import 'package:f_movie_db/core/utils/paddings.dart';
import 'package:f_movie_db/data/model/results.dart';
import 'package:f_movie_db/widgets/movie_item_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesListView extends StatelessWidget {
  final List<Results> list;
  final String title;
  const MoviesListView({
    super.key,
    required this.list,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {}),
      child: Column(
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
              itemCount: 20,
              itemBuilder: (context, index) {
                Results item = list[index];
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
      ),
    );
  }
}
