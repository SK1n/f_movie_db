import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:f_movie_db/core/const.dart';
import 'package:f_movie_db/core/utils/paddings.dart';
import 'package:f_movie_db/data/model/movie_credits/movie_credits_cast.dart';
import 'package:f_movie_db/data/model/movie_credits/movie_credits_crew.dart';
import 'package:f_movie_db/data/model/movie_details/movie_details.dart';
import 'package:f_movie_db/modules/movies_details/controllers/movie_item_controller.dart';
import 'package:f_movie_db/modules/movies_details/views/movies_details_credits_view.dart';
import 'package:f_movie_db/widgets/custom_app_bar/views/custom_app_bar.dart';
import 'package:f_movie_db/widgets/futuristic.dart';
import 'package:f_movie_db/modules/movies_details/controllers/movie_credits_controller.dart';
import 'package:f_movie_db/widgets/carousell_image_widget.dart';
import 'package:f_movie_db/widgets/poster_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';

class MoviePageView extends StatelessWidget {
  const MoviePageView({super.key});
  @override
  Widget build(BuildContext context) {
    int id = Get.arguments[0];
    final MovieItemController movieItemController = Get.find();
    return Scaffold(
      appBar: const CustomAppBar(
        title: '',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Paddings.allPaddings),
          child: Column(
            children: [
              Futuristic(
                futureBuilder: () => movieItemController.getData(id),
                dataBuilder: (context, snapshot) {
                  MovieDetails data = snapshot.data;
                  return Column(
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          PosterImageWidget(
                              condition: data.posterPath != null,
                              link: data.posterPath ?? ''),
                          Container(
                            color: Colors.black54,
                            width: Get.width,
                            alignment: Alignment.center,
                            height: 200,
                            child: Text(
                              '${data.title}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: context
                                      .textTheme.displayMedium!.fontSize),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AutoSizeText(
                              '${data.releaseDate}',
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AutoSizeText(
                          '${data.overview}',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  );
                },
              ),
              MoviesDetailsCastView(id: id),
            ],
          ),
        ),
      ),
    );
  }
}
