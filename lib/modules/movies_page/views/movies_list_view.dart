import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:f_movie_db/core/const.dart';
import 'package:f_movie_db/core/utils/paddings.dart';
import 'package:f_movie_db/data/model/movies_results.dart';
import 'package:f_movie_db/routes/app_routes.dart';
import 'package:f_movie_db/widgets/carousell_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';

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

              return SizedBox(
                width: 100,
                child: InkWell(
                  onTap: (() {
                    Get.toNamed(Routes.moviesDetails, arguments: [item.id]);
                  }),
                  child: Card(
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        CarousellImageWidget(
                            condition: item.posterPath != null,
                            link: item.posterPath!),
                        Container(
                          color: Colors.black87,
                          width: Get.width / 2,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AutoSizeText(
                              '${item.title}',
                              maxLines: 2,
                              minFontSize: 8,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
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
