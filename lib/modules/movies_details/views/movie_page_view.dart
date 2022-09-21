import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chip_list/chip_list.dart';
import 'package:f_movie_db/core/const.dart';
import 'package:f_movie_db/core/utils/paddings.dart';
import 'package:f_movie_db/data/model/movie_credits/movie_credits_cast.dart';
import 'package:f_movie_db/data/model/movie_credits/movie_credits_crew.dart';
import 'package:f_movie_db/data/model/movie_details/movie_details.dart';
import 'package:f_movie_db/modules/movies_details/controllers/movie_item_controller.dart';
import 'package:f_movie_db/modules/movies_details/controllers/movies_videos_controller.dart';
import 'package:f_movie_db/modules/movies_details/views/movies_details_credits_view.dart';
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

extension GetYear on String {
  String getYearFromString() {
    return substring(0, 4);
  }
}

class MoviePageView extends StatelessWidget {
  const MoviePageView({super.key});
  @override
  Widget build(BuildContext context) {
    int id = Get.arguments[0];
    final MovieItemController movieItemController = Get.find();
    final MoviesVideosController moviesVideosController = Get.find();
    return Futuristic(
      futureBuilder: () => movieItemController.getData(id),
      dataBuilder: (context, snapshot) {
        MovieDetails item = snapshot.data;
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 400,
                floating: false,
                pinned: true,
                flexibleSpace: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  movieItemController.biggest = constraints.biggest.height;
                  return Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      FlexibleSpaceBar(
                        centerTitle: true,
                        title: SizedBox(
                          height: 400,
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Positioned(
                                bottom:
                                    movieItemController.biggest > 400 ? 20 : 0,
                                child: SizedBox(
                                  width: Get.width / 2,
                                  height: 40,
                                  child: AutoSizeText(
                                    item.title!.toUpperCase(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontFamily: GoogleFonts.passionOne()
                                            .fontFamily),
                                  ),
                                ),
                              ),
                              movieItemController.biggest > 250
                                  ? Positioned(
                                      bottom: 1,
                                      child: Text(
                                        movieItemController.createDetailsText(
                                            item.releaseDate!
                                                .getYearFromString(),
                                            item.genres,
                                            item.runtime),
                                        //'${item.releaseDate!.getYearFromString()} • Action • 2h 40m',
                                        style: const TextStyle(
                                          fontSize: 10,
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                        background: PosterImageWidget(link: item.posterPath!),
                      ),
                    ],
                  );
                }),
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
                      Futuristic(
                        futureBuilder: () =>
                            moviesVideosController.getVideo(id),
                        onError: (p0, p1) {
                          return const Text('error');
                        },
                        dataBuilder: ((p0, video) {
                          return video.data != null
                              ? Card(
                                  child: TextButton.icon(
                                      icon: const Icon(Icons.play_arrow),
                                      label: const Text('Play video'),
                                      onPressed: () => Get.defaultDialog(
                                            title: '',
                                            actions: [
                                              TextButton(
                                                onPressed: () => Get.back(),
                                                child: const Text('Close'),
                                              ),
                                            ],
                                            content: SizedBox(
                                              height: 250,
                                              width: 250,
                                              child: YoutubePlayerBuilder(
                                                player: YoutubePlayer(
                                                  controller:
                                                      moviesVideosController
                                                          .videoPlayerController!,
                                                ),
                                                builder: ((context, item) {
                                                  return item;
                                                }),
                                              ),
                                            ),
                                          )),
                                )
                              : Container();
                        }),
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
