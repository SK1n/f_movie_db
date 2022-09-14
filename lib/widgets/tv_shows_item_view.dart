import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:f_movie_db/core/const.dart';
import 'package:f_movie_db/data/model/tv_shows_results.dart';
import 'package:f_movie_db/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';

class TvShowsItemView extends StatelessWidget {
  final TvShowsResults item;
  final int id;
  const TvShowsItemView({super.key, required this.item, required this.id});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        Get.toNamed(Routes.tvShowsPage, arguments: [item, id]);
      }),
      child: Card(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            OctoImage(
              image: CachedNetworkImageProvider(
                  '$baseImageUrl${item.backdropPath}'),
              placeholderBuilder: OctoPlaceholder.blurHash(
                blurHash,
              ),
              height: 200,
              width: Get.width / 2,
              errorBuilder: OctoError.icon(color: Colors.red),
              fit: BoxFit.cover,
            ),
            Container(
              color: Colors.black87,
              width: Get.width / 2,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText(
                  '${item.name}',
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
