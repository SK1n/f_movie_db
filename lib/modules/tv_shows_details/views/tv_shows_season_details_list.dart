import 'dart:ffi';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:f_movie_db/data/model/tv_shows_details/tv_shows_details_seasons.dart';
import 'package:f_movie_db/data/model/tv_shows_season_details/tv_shows_season_details.dart';
import 'package:f_movie_db/data/model/tv_shows_season_details/tv_shows_season_episodes.dart';
import 'package:f_movie_db/modules/tv_shows_season_details/controllers/tv_shows_season_details_controller.dart';
import 'package:f_movie_db/routes/app_routes.dart';
import 'package:f_movie_db/widgets/futuristic.dart';
import 'package:f_movie_db/widgets/poster_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TvShowsSeasonDetailsList extends StatelessWidget {
  final int id;
  final List<TvShowsDetailsSeasons> list;
  final num? numberOfSeasons;
  const TvShowsSeasonDetailsList(
      {super.key,
      required this.id,
      required this.list,
      required this.numberOfSeasons});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(8.0),
      sliver: SliverList(
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
                                link: list[index].posterPath,
                              ),
                            ),
                            Positioned(
                              left: Get.width / 2,
                              height: 20,
                              child: SizedBox(
                                width: Get.width / 2,
                                child: AutoSizeText(
                                  list[index].name!,
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
                                  list[index].overview!,
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
                            link: list[index].posterPath,
                          ),
                        ),
                        SizedBox(
                          width: Get.width,
                          height: 40,
                          child: AutoSizeText(
                            list[index].name!,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        list[index].overview!.isNotEmpty
                            ? SizedBox(
                                height: 80,
                                width: Get.width,
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: AutoSizeText(
                                    list[index].overview!,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )
                            : Container(),
                        Card(
                          margin: const EdgeInsets.all(8.0),
                          child: TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: context.theme.focusColor),
                              onPressed: () {
                                Get.toNamed(
                                  Routes.tvShowsSeasonDetails,
                                  arguments: [id, list[index].seasonNumber],
                                );
                              },
                              child: SizedBox(
                                  width: Get.width,
                                  child:
                                      const Center(child: Text('Episodes')))),
                        )
                      ],
                    ),
                  ))),
                ),
              ),
            ),
            itemCount: numberOfSeasons!.toInt(),
          ),
        ]),
      ),
    );
  }
}
