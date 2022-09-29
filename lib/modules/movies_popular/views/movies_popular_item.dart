import 'package:auto_size_text/auto_size_text.dart';
import 'package:f_movie_db/data/model/movies/movies_results.dart';
import 'package:f_movie_db/widgets/carousell_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesPopularItem extends StatelessWidget {
  final MoviesResults item;
  final String posterId;
  const MoviesPopularItem(
      {super.key, required this.item, required this.posterId});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        Get.toNamed('movie', arguments: [item.id, posterId]);
      }),
      child: Card(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            CarousellImageWidget(link: item.posterPath!),
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
    );
  }
}
