import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:f_movie_db/core/const.dart';
import 'package:f_movie_db/data/model/movie_credits/movie_credits_crew.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

class CrewItemView extends StatelessWidget {
  final MovieCreditsCrew item;
  const CrewItemView({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          item.profilePath != null
              ? OctoImage(
                  image: CachedNetworkImageProvider(
                      '$baseImageUrl${item.profilePath}'),
                  placeholderBuilder: OctoPlaceholder.blurHash(
                    blurHash,
                  ),
                  width: 100,
                  height: 192,
                  errorBuilder: OctoError.icon(color: Colors.red),
                  fit: BoxFit.cover,
                )
              : const Card(
                  color: Colors.black,
                  child: SizedBox(
                    width: 100,
                    height: 192,
                    child: Icon(Icons.error),
                  ),
                ),
          Container(
            width: 100,
            height: 50,
            color: Colors.black87,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(
                '${item.name}',
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
