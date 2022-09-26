import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:f_movie_db/data/services/videos_client.dart';
import 'package:f_movie_db/widgets/app_bar/controllers/app_bar_controller.dart';
import 'package:f_movie_db/widgets/futuristic.dart';
import 'package:f_movie_db/widgets/poster_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TvShowsSeasonDetailsAppBarView extends StatelessWidget {
  final String title;
  final int id;
  final String posterPath;
  const TvShowsSeasonDetailsAppBarView({
    super.key,
    required this.title,
    required this.posterPath,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    AppBarController controller =
        Get.put(AppBarController(VideosClient(httpClient: Dio())));
    return SliverAppBar(
      expandedHeight: 400,
      floating: false,
      pinned: true,
      flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        controller.biggest = constraints.biggest.height;
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
                      bottom: controller.biggest > 400 ? 40 : 0,
                      child: SizedBox(
                        width: Get.width / 2,
                        height: 40,
                        child: AutoSizeText(
                          title.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 30,
                              fontFamily: GoogleFonts.passionOne().fontFamily),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              background: PosterImageWidget(link: posterPath),
            ),
          ],
        );
      }),
    );
  }
}
