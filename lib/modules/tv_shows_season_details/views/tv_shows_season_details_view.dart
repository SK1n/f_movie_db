import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:f_movie_db/data/model/tv_shows_season_details/tv_shows_season_details.dart';
import 'package:f_movie_db/data/model/tv_shows_season_details/tv_shows_season_episodes.dart';
import 'package:f_movie_db/modules/tv_shows_season_details/controllers/tv_shows_season_details_controller.dart';
import 'package:f_movie_db/widgets/app_bar/views/tv_shows_season_details_app_bar_view.dart';
import 'package:f_movie_db/widgets/futuristic.dart';
import 'package:f_movie_db/widgets/poster_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TvShowsSeasonDetailsView extends StatelessWidget {
  const TvShowsSeasonDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int? id = Get.arguments[0];
    int? seasonNumber = Get.arguments[1];
    TvShowsSeasonDetailsController controller = Get.find();
    return Futuristic(
      futureBuilder: () => controller.getData(id, seasonNumber),
      dataBuilder: (context, snapshot) {
        TvShowsSeasonDetails item = snapshot.data;
        List<TvShowsSeasonEpisodes>? episodes = item.episodes;
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              TvShowsSeasonDetailsAppBarView(
                  title: item.name!, posterPath: item.posterPath!, id: id!),
              SliverList(
                delegate: SliverChildListDelegate([
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ExpandableNotifier(
                      child: ScrollOnExpand(
                        child: ExpandablePanel(
                          collapsed: ExpandableButton(
                            child: Card(
                              child: SizedBox(
                                width: Get.width,
                                height: 100,
                                child: Stack(
                                  children: [
                                    SizedBox(
                                      width: Get.width / 2,
                                      child: PosterImageWidget(
                                        link: episodes![index].stillPath,
                                      ),
                                    ),
                                    Positioned(
                                      left: Get.width / 2,
                                      height: 20,
                                      child: SizedBox(
                                        width: Get.width / 2,
                                        child: AutoSizeText(
                                          episodes[index].name!,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 20,
                                      left: Get.width / 2,
                                      child: SizedBox(
                                        height: 80,
                                        width: Get.width / 2,
                                        child: AutoSizeText(
                                          episodes[index].overview!,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          expanded: ExpandableButton(
                              child: Card(
                                  child: SizedBox(
                            width: Get.width,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: Get.width,
                                  height: 150,
                                  child: PosterImageWidget(
                                    link: episodes[index].stillPath,
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width,
                                  height: 40,
                                  child: AutoSizeText(
                                    episodes[index].name!,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                episodes[index].overview!.isNotEmpty
                                    ? SizedBox(
                                        height: 80,
                                        width: Get.width,
                                        child: Container(
                                          padding: const EdgeInsets.all(8.0),
                                          child: AutoSizeText(
                                            episodes[index].overview!,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ))),
                        ),
                      ),
                    ),
                    itemCount: item.episodes!.length.toInt(),
                  ),
                ]),
              ),
            ],
          ),
        );
      },
    );
  }
}
