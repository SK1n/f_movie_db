import 'package:cached_network_image/cached_network_image.dart';
import 'package:f_movie_db/core/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';

class PosterImageWidget extends StatelessWidget {
  final String? link;
  const PosterImageWidget({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            context.theme.scaffoldBackgroundColor.withOpacity(0.6),
            BlendMode.dstATop,
          ),
          image: CachedNetworkImageProvider(
              link != null
                  ? '$baseImageUrl$link'
                  : 'https://developers.google.com/static/maps/documentation/streetview/images/error-image-generic.png?hl=sv',
              errorListener: (() {})),
        ),
      ),
    );
  }
}
