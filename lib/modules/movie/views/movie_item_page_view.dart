import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:f_movie_db/core/utils/paddings.dart';
import 'package:f_movie_db/data/model/results.dart';
import 'package:f_movie_db/global_widgets/custom_app_bar.dart';
import 'package:f_movie_db/modules/main_screen/views/movie_item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';

class MovieItemPageView extends StatelessWidget {
  const MovieItemPageView({super.key});
  @override
  Widget build(BuildContext context) {
    Results item = Get.arguments[0];
    int id = Get.arguments[1];
    return Scaffold(
      appBar: CustomAppBar(
        title: '${item.title}',
      ),
      body: Padding(
        padding: const EdgeInsets.all(Paddings.allPaddings),
        child: Hero(
          tag: 'poster${item.id}$id',
          child: Card(
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                OctoImage(
                  image: CachedNetworkImageProvider(
                      'https://image.tmdb.org/t/p/w500/${item.posterPath}'),
                  placeholderBuilder: OctoPlaceholder.blurHash(
                    'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                  ),
                  width: Get.width,
                  height: 192,
                  errorBuilder: OctoError.icon(color: Colors.red),
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
