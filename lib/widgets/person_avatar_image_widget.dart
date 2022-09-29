import 'package:cached_network_image/cached_network_image.dart';
import 'package:f_movie_db/core/const.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

class PersonAvatarImageWidget extends StatelessWidget {
  final String? link;
  const PersonAvatarImageWidget({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OctoImage.fromSet(
        width: 150,
        image: CachedNetworkImageProvider(
          link != null
              ? '$baseImageUrl$link'
              : 'https://developers.google.com/static/maps/documentation/streetview/images/error-image-generic.png?hl=sv',
        ),
        octoSet: OctoSet.circleAvatar(
            backgroundColor: Colors.red, text: const Text('Loading...')),
        fit: BoxFit.cover,
      ),
    );
  }
}
