import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chip_list/chip_list.dart';
import 'package:f_movie_db/core/const.dart';
import 'package:f_movie_db/core/utils/end_points.dart';
import 'package:f_movie_db/core/utils/paddings.dart';
import 'package:f_movie_db/data/model/movie_credits/movie_credits_cast.dart';
import 'package:f_movie_db/data/model/movie_credits/movie_credits_crew.dart';
import 'package:f_movie_db/data/model/movie_details/movie_details.dart';
import 'package:f_movie_db/modules/movies_details/controllers/movie_item_controller.dart';
import 'package:f_movie_db/modules/movies_details/controllers/movies_videos_controller.dart';
import 'package:f_movie_db/modules/movies_details/views/movies_details_credits_view.dart';
import 'package:f_movie_db/widgets/app_bar/views/app_bar_view.dart';
import 'package:f_movie_db/widgets/custom_app_bar/views/custom_app_bar.dart';
import 'package:f_movie_db/widgets/futuristic.dart';
import 'package:f_movie_db/modules/movies_details/controllers/movie_credits_controller.dart';
import 'package:f_movie_db/widgets/carousell_image_widget.dart';
import 'package:f_movie_db/widgets/poster_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:rich_text_view/rich_text_view.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MoviePageView extends StatelessWidget {
  const MoviePageView({super.key});
  @override
  Widget build(BuildContext context) {
    int id = Get.arguments[0];
    final MovieItemController movieItemController = Get.find();
    return Futuristic(
      futureBuilder: () => movieItemController.getData(id),
      dataBuilder: (context, snapshot) {
        MovieDetails item = snapshot.data;
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              AppBarView(
                title: item.title!,
                id: item.id!,
                releaseDate: item.releaseDate!,
                genres: item.genres!,
                runtime: item.runtime!,
                endPoint: EndPoints(id: item.id).moviesVideosResults,
                posterPath: item.posterPath!,
              ),
              SliverPadding(
                padding: const EdgeInsets.all(8.0),
                sliver: SliverList(
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
                      MoviesDetailsCastView(id: item.id!),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
