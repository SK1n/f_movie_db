import 'package:cached_network_image/cached_network_image.dart';
import 'package:f_movie_db/core/const.dart';
import 'package:f_movie_db/modules/credits/controllers/credits_movies_controller.dart';
import 'package:f_movie_db/widgets/custom_app_bar.dart';
import 'package:f_movie_db/widgets/futuristic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';

class CreditsView extends StatelessWidget {
  const CreditsView({super.key});

  @override
  Widget build(BuildContext context) {
    int id = Get.arguments[0];
    CreditsMoviesController creditsMoviesController = Get.find();
    return Scaffold(
      appBar: const CustomAppBar(
        title: '',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            OctoImage(
              image: CachedNetworkImageProvider('$baseImageUrl$id'),
              placeholderBuilder: OctoPlaceholder.blurHash(
                blurHash,
              ),
              height: 200,
              width: Get.width / 2,
              errorBuilder: OctoError.icon(color: Colors.red),
              fit: BoxFit.cover,
            ),
            Futuristic(
                futureBuilder: () =>
                    creditsMoviesController.getMoviesCreditsData(id),
                dataBuilder: (context, item) {
                  // return MoviesCreditsCastListView(
                  //     list: creditsMoviesController.cast, title: 'Cast');
                  return Container();
                }),
          ],
        ),
      ),
    );
  }
}
