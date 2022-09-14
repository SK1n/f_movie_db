import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:f_movie_db/core/const.dart';
import 'package:f_movie_db/core/utils/end_points.dart';
import 'package:f_movie_db/core/utils/paddings.dart';
import 'package:f_movie_db/data/model/cast.dart';
import 'package:f_movie_db/data/model/crew.dart';
import 'package:f_movie_db/data/model/tv_shows_results.dart';
import 'package:f_movie_db/modules/tv_show/controllers/tv_shows_person_item_controller.dart';
import 'package:f_movie_db/widgets/custom_app_bar.dart';
import 'package:f_movie_db/widgets/futuristic.dart';
import 'package:f_movie_db/widgets/cast_item_view.dart';
import 'package:f_movie_db/widgets/crew_item_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TvShowsItemPageUI extends StatelessWidget {
  const TvShowsItemPageUI({super.key});
  @override
  Widget build(BuildContext context) {
    TvShowsResults item = Get.arguments[0];
    int id = Get.arguments[1];
    final TvShowsPersonItemController controller = Get.find();
    EndPoints endPoints = EndPoints(id: item.id);
    return Scaffold(
      appBar: CustomAppBar(
        title: '${item.name}',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Paddings.allPaddings),
          child: Column(
            children: [
              Futuristic(
                useQuery: false,
                futureBuilder: () =>
                    controller.getVideo(endPoints.tvShowsVideo),
                dataBuilder: ((p0, p1) {
                  return YoutubePlayerBuilder(
                    player: YoutubePlayer(
                        width: Get.width - 20,
                        controller: controller.videoPlayerController!),
                    builder: ((p0, p1) {
                      return p1;
                    }),
                  );
                }),
              ),
              Hero(
                tag: 'poster${item.id}$id',
                child: Card(
                  child: OctoImage(
                    image: CachedNetworkImageProvider(
                        'https://image.tmdb.org/t/p/w500/${item.posterPath}'),
                    placeholderBuilder: OctoPlaceholder.blurHash(
                      blurHash,
                    ),
                    width: Get.width,
                    height: 192,
                    errorBuilder: OctoError.icon(color: Colors.red),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Paddings.allPaddings),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText('${item.overview}'),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: AutoSizeText(
                        'Release date: ${item.firstAirDate}',
                      ),
                    ),
                    Futuristic(
                      futureBuilder: () => controller.getData(item.id),
                      useQuery: false,
                      dataBuilder: (p0, p1) {
                        return Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: AutoSizeText(
                                'Crew',
                              ),
                            ),
                            SizedBox(
                              height: 200,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.lengthCrew,
                                itemBuilder: (context, index) {
                                  Crew item = controller.crew[index];
                                  return CrewItemView(
                                    item: item,
                                  );
                                },
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: AutoSizeText(
                                'Cast',
                              ),
                            ),
                            SizedBox(
                              height: 200,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.lengthCast,
                                itemBuilder: (context, index) {
                                  Cast item = controller.cast[index];
                                  return CastItemView(
                                    item: item,
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
