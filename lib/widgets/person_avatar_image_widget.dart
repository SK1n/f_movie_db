import 'package:cached_network_image/cached_network_image.dart';
import 'package:f_movie_db/core/const.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

class PersonAvatarImageWidget extends StatelessWidget {
  final bool condition;
  final String link;
  const PersonAvatarImageWidget(
      {super.key, required this.condition, required this.link});

  @override
  Widget build(BuildContext context) {
    return condition
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: OctoImage.fromSet(
              width: 150,
              image: CachedNetworkImageProvider('$baseImageUrl$link'),
              octoSet: OctoSet.circleAvatar(
                  backgroundColor: Colors.red, text: const Text('Loading...')),
              fit: BoxFit.cover,
            ),
          )
        : Container();
  }
}
