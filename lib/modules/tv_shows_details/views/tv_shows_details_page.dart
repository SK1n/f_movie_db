import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:f_movie_db/core/const.dart';
import 'package:f_movie_db/core/utils/end_points.dart';
import 'package:f_movie_db/core/utils/paddings.dart';
import 'package:f_movie_db/data/model/tv_shows_credits.dart/tv_shows_credits.dart';
import 'package:f_movie_db/data/model/tv_shows_details/tv_shows_details.dart';
import 'package:f_movie_db/modules/tv_shows_details/controllers/tv_shows_credits_controller.dart';
import 'package:f_movie_db/modules/tv_shows_details/controllers/tv_shows_item_controller.dart';
import 'package:f_movie_db/modules/tv_shows_details/views/tv_shows_cast_list_view.dart';
import 'package:f_movie_db/modules/tv_shows_details/views/tv_shows_crew_list_view.dart';
import 'package:f_movie_db/widgets/app_bar/views/app_bar_view.dart';
import 'package:f_movie_db/widgets/custom_app_bar/views/custom_app_bar.dart';
import 'package:f_movie_db/widgets/futuristic.dart';
import 'package:f_movie_db/widgets/carousell_image_widget.dart';
import 'package:f_movie_db/widgets/poster_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';
import 'package:rich_text_view/rich_text_view.dart';

class TvShowsDetailsPage extends StatelessWidget {
  const TvShowsDetailsPage({super.key});
  @override
  Widget build(BuildContext context) {
    int id = Get.arguments[0];
    final TvShowsCreditsController tvShowsCreditsController = Get.find();
    final TvShowsItemController tvShowsItemController = Get.find();
    return Futuristic(
      futureBuilder: () => tvShowsItemController.getData(id),
      dataBuilder: (context, snapshot) {
        TvShowsDetails item = snapshot.data;
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              AppBarView(
                title: item.name!,
                releaseDate: item.firstAirDate!,
                genres: item.genres!,
                runtime: item.episodeRunTime!.isNotEmpty
                    ? item.episodeRunTime![0]
                    : null,
                posterPath: item.posterPath!,
                endPoint: EndPoints(id: item.id).tvShowsVideo,
                id: id,
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    RichTextView(
                      text: '${item.overview}',
                      textAlign: TextAlign.start,
                      truncate: true,
                      viewLessText: 'less',
                      linkStyle: const TextStyle(color: Colors.blue),
                      maxLines: 5,
                      supportedTypes: const [
                        ParsedType.EMAIL,
                        ParsedType.HASH,
                        ParsedType.MENTION,
                        ParsedType.URL,
                        ParsedType.BOLD
                      ],
                    ),
                    Futuristic(
                      futureBuilder: () => tvShowsCreditsController.getData(id),
                      dataBuilder: (context, snapshot) {
                        TvShowsCredits item = snapshot.data;
                        item.cast!.removeWhere(
                            (element) => element.profilePath == null);
                        item.crew!.removeWhere(
                          (element) => element.profilePath == null,
                        );
                        return TvShowsCastListView(
                          list: item.cast!,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
