import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:f_movie_db/core/const.dart';
import 'package:f_movie_db/data/model/tv_shows_credits.dart/tv_shows_credits_cast.dart';
import 'package:f_movie_db/routes/app_routes.dart';
import 'package:f_movie_db/widgets/carousell_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';

import '../../../core/utils/paddings.dart';

class TvShowsCastListView extends StatelessWidget {
  final List<TvShowsCreditsCast> list;
  const TvShowsCastListView({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Paddings.allPaddings),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
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
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (() => Get.toNamed(Routes.personDetails,
                          arguments: [list[index].id, list[index].name])),
                      child: Card(
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            CarousellImageWidget(
                                condition: list[index].profilePath != null,
                                link: list[index].profilePath ?? ''),
                            Container(
                              width: 100,
                              height: 50,
                              color: Colors.black87,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: AutoSizeText(
                                  '${list[index].name}',
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
