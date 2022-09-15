import 'dart:math';

import 'package:f_movie_db/core/utils/paddings.dart';
import 'package:f_movie_db/data/model/credits_movies_cast.dart';
import 'package:f_movie_db/data/model/credits_movies_crew.dart';
import 'package:f_movie_db/data/model/movies_results.dart';
import 'package:f_movie_db/data/services/credits_movies_client.dart';
import 'package:f_movie_db/modules/credits/views/movies_cast/movies_credits_cast_item_view.dart';
import 'package:f_movie_db/widgets/movie_item_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesCreditsCastListView extends StatelessWidget {
  final List<CreditsMoviesCast> list;
  final String title;
  const MoviesCreditsCastListView({
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
              CreditsMoviesCast item = list[index];
              int id = Random().nextInt(50000);
              return Hero(
                tag: 'poster${item.id}$id',
                child: SizedBox(
                  width: 100,
                  child: MoviesCreditsCastItemView(
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
  }
}
