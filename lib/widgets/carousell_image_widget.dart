import 'package:cached_network_image/cached_network_image.dart';
import 'package:f_movie_db/core/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';

class CarousellImageWidget extends StatelessWidget {
  final String? link;
  const CarousellImageWidget({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    return OctoImage(
      image: CachedNetworkImageProvider(
        link != null
            ? '$baseImageUrl$link'
            : 'https://developers.google.com/static/maps/documentation/streetview/images/error-image-generic.png?hl=sv',
      ),
      placeholderBuilder: OctoPlaceholder.blurHash(
        blurHash,
      ),
      height: 200,
      width: Get.width,
      errorBuilder: OctoError.icon(color: Colors.red),
      fit: BoxFit.cover,
    );
  }
}
