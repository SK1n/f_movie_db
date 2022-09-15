import 'package:cached_network_image/cached_network_image.dart';
import 'package:f_movie_db/core/const.dart';
import 'package:f_movie_db/data/model/crew.dart';
import 'package:f_movie_db/data/model/person_details.dart';
import 'package:f_movie_db/modules/credits/controllers/credits_controller.dart';
import 'package:f_movie_db/modules/credits/controllers/credits_movies_controller.dart';
import 'package:f_movie_db/modules/credits/views/movies_cast/movies_credits_cast_list_view.dart';
import 'package:f_movie_db/widgets/custom_app_bar.dart';
import 'package:f_movie_db/widgets/futuristic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';

class CreditsView extends StatelessWidget {
  const CreditsView({super.key});

  @override
  Widget build(BuildContext context) {
    Crew item = Get.arguments[0];
    CreditsController creditsController = Get.find();
    CreditsMoviesController creditsMoviesController = Get.find();
    return Scaffold(
      appBar: CustomAppBar(
        title: item.name!,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            OctoImage(
              image: CachedNetworkImageProvider(
                  '$baseImageUrl${item.profilePath}'),
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
                    creditsMoviesController.getMoviesCreditsData(item.id),
                useQuery: false,
                dataBuilder: (context, item) {
                  return MoviesCreditsCastListView(
                      list: creditsMoviesController.cast, title: 'Cast');
                }),
          ],
        ),
      ),
    );
  }
}
