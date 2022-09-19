import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:f_movie_db/core/const.dart';
import 'package:f_movie_db/core/utils/paddings.dart';
import 'package:f_movie_db/data/model/tv_shows_credits.dart/tv_shows_credits.dart';
import 'package:f_movie_db/data/model/tv_shows_details/tv_shows_details.dart';
import 'package:f_movie_db/modules/tv_shows_details/controllers/tv_shows_credits_controller.dart';
import 'package:f_movie_db/modules/tv_shows_details/controllers/tv_shows_item_controller.dart';
import 'package:f_movie_db/modules/tv_shows_details/views/tv_shows_cast_list_view.dart';
import 'package:f_movie_db/modules/tv_shows_details/views/tv_shows_crew_list_view.dart';
import 'package:f_movie_db/widgets/custom_app_bar/views/custom_app_bar.dart';
import 'package:f_movie_db/widgets/futuristic.dart';
import 'package:f_movie_db/widgets/carousell_image_widget.dart';
import 'package:f_movie_db/widgets/poster_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';

class TvShowsDetailsPage extends StatelessWidget {
  const TvShowsDetailsPage({super.key});
  @override
  Widget build(BuildContext context) {
    int id = Get.arguments[0];
    final TvShowsCreditsController tvShowsCreditsController = Get.find();
    final TvShowsItemController tvShowsItemController = Get.find();
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //TODO: Find a place for this video!

            // Hero(
            //   tag: posterId,
            //   child: Futuristic(
            //     futureBuilder: () => tvShowsVideoController.getVideo(id),
            //     onError: (p0, p1) {
            //       return const Text('error');
            //     },
            //     dataBuilder: ((p0, p1) {
            //       return YoutubePlayerBuilder(
            //         player: YoutubePlayer(
            //             width: Get.width,
            //             controller:
            //                 tvShowsVideoController.videoPlayerController!),
            //         builder: ((context, item) {
            //           return item;
            //         }),
            //       );
            //     }),
            //   ),
            // ),
            Futuristic(
              futureBuilder: () => tvShowsItemController.getData(id),
              dataBuilder: (context, snapshot) {
                TvShowsDetails item = snapshot.data;
                return Column(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        PosterImageWidget(
                            condition: item.posterPath != null,
                            link: item.posterPath ?? ''),
                        Container(
                          color: Colors.black54,
                          width: Get.width,
                          alignment: Alignment.center,
                          height: 200,
                          child: Text(
                            '${item.name}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize:
                                    context.textTheme.displayMedium!.fontSize),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AutoSizeText(
                            '${item.firstAirDate}',
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          AutoSizeText(
                            '${item.overview}',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            Futuristic(
              futureBuilder: () => tvShowsCreditsController.getData(id),
              dataBuilder: (context, snapshot) {
                TvShowsCredits item = snapshot.data;
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(Paddings.allPaddings),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TvShowsCastListView(
                            list: item.cast!,
                          ),
                          TvShowsCrewListView(list: item.crew!),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
