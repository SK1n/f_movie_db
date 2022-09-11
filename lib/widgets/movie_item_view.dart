import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:f_movie_db/core/const.dart';
import 'package:f_movie_db/data/model/results.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';

class MovieItemView extends StatelessWidget {
  final Results item;
  final int id;
  const MovieItemView({super.key, required this.item, required this.id});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        Get.toNamed('movie', arguments: [item, id]);
      }),
      child: Card(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            OctoImage(
              image:
                  CachedNetworkImageProvider('$baseImageUrl${item.posterPath}'),
              placeholderBuilder: OctoPlaceholder.blurHash(
                'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
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
