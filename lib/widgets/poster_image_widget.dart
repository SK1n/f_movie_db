import 'package:cached_network_image/cached_network_image.dart';
import 'package:f_movie_db/core/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';

class PosterImageWidget extends StatelessWidget {
  final bool condition;
  final String link;
  const PosterImageWidget(
      {super.key, required this.condition, required this.link});

  @override
  Widget build(BuildContext context) {
    return condition
        ? OctoImage(
            image: CachedNetworkImageProvider('$baseImageUrl$link'),
            placeholderBuilder: OctoPlaceholder.blurHash(
              blurHash,
            ),
            height: 200,
            width: Get.width,
            errorBuilder: OctoError.icon(color: Colors.red),
            fit: BoxFit.cover,
          )
        : SizedBox(
            width: Get.width,
            height: 200,
            child: Image.asset('assets/icons/error_white.png'),
          );
  }
}
