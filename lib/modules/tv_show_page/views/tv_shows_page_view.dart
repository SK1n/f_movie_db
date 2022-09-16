import 'package:auto_size_text/auto_size_text.dart';
import 'package:f_movie_db/core/utils/paddings.dart';
import 'package:f_movie_db/data/model/tv_shows_credits.dart/tv_shows_credits.dart';
import 'package:f_movie_db/data/model/tv_shows_credits.dart/tv_shows_credits_cast.dart';
import 'package:f_movie_db/data/model/tv_shows_credits.dart/tv_shows_credits_crew.dart';
import 'package:f_movie_db/data/model/tv_shows_details/tv_shows_details.dart';
import 'package:f_movie_db/modules/tv_show_page/controllers/tv_shows_credits_controller.dart';
import 'package:f_movie_db/modules/tv_show_page/controllers/tv_shows_item_controller.dart';
import 'package:f_movie_db/modules/tv_show_page/controllers/tv_shows_video_controller.dart';
import 'package:f_movie_db/modules/tv_show_page/views/tv_shows_cast_item.dart';
import 'package:f_movie_db/modules/tv_show_page/views/tv_shows_crew_item.dart';
import 'package:f_movie_db/widgets/custom_app_bar.dart';
import 'package:f_movie_db/widgets/futuristic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TvShowsItemPageUI extends StatelessWidget {
  const TvShowsItemPageUI({super.key});
  @override
  Widget build(BuildContext context) {
    int id = Get.arguments[0];
    String posterId = Get.arguments[1];
    final TvShowsCreditsController tvShowsCreditsController = Get.find();
    final TvShowsVideoController tvShowsVideoController = Get.find();
    final TvShowsItemController tvShowsItemController = Get.find();
    return Scaffold(
      appBar: const CustomAppBar(
        title: '',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Paddings.allPaddings),
          child: Column(
            children: [
              Hero(
                tag: posterId,
                child: Futuristic(
                  futureBuilder: () => tvShowsVideoController.getVideo(id),
                  onError: (p0, p1) {
                    return const Text('error');
                  },
                  dataBuilder: ((p0, p1) {
                    return YoutubePlayerBuilder(
                      player: YoutubePlayer(
                          width: Get.width - 20,
                          controller:
                              tvShowsVideoController.videoPlayerController!),
                      builder: ((context, item) {
                        return item;
                      }),
                    );
                  }),
                ),
              ),
              Futuristic(
                futureBuilder: () => tvShowsItemController.getData(id),
                dataBuilder: (context, snapshot) {
                  TvShowsDetails item = snapshot.data;
                  return Column(
                    children: [
                      AutoSizeText('${item.overview}'),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: AutoSizeText(
                          'Release date: ${item.firstAirDate}',
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
                  List<TvShowsCreditsCast>? cast = item.cast;
                  List<TvShowsCreditsCrew>? crew = item.crew;
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(Paddings.allPaddings),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            crew!.isNotEmpty
                                ? Column(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            top: 8.0, bottom: 8.0),
                                        child: AutoSizeText(
                                          'Crew',
                                        ),
                                      ),
                                      SizedBox(
                                        height: 200,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: crew.length,
                                          itemBuilder: (context, index) {
                                            return TvShowsCrewItemView(
                                              item: crew[index],
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  )
                                : Container(),
                            cast!.isNotEmpty
                                ? Column(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            top: 8.0, bottom: 8.0),
                                        child: AutoSizeText(
                                          'Cast',
                                        ),
                                      ),
                                      SizedBox(
                                        height: 200,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: cast.length,
                                          itemBuilder: (context, index) {
                                            return TvShowsCastItemView(
                                              item: cast[index],
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  )
                                : Container(),
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
      ),
    );
  }
}
