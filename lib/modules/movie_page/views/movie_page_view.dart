import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:f_movie_db/core/const.dart';
import 'package:f_movie_db/core/utils/paddings.dart';
import 'package:f_movie_db/data/model/movie_credits/movie_credits_cast.dart';
import 'package:f_movie_db/data/model/movie_credits/movie_credits_crew.dart';
import 'package:f_movie_db/data/model/movie_details/movie_details.dart';
import 'package:f_movie_db/modules/movie_page/controllers/movie_item_controller.dart';
import 'package:f_movie_db/widgets/custom_app_bar.dart';
import 'package:f_movie_db/widgets/futuristic.dart';
import 'package:f_movie_db/modules/movie_page/controllers/movie_credits_controller.dart';
import 'package:f_movie_db/widgets/cast_item_view.dart';
import 'package:f_movie_db/widgets/crew_item_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';

class MoviePageView extends StatelessWidget {
  const MoviePageView({super.key});
  @override
  Widget build(BuildContext context) {
    int id = Get.arguments[0];
    String posterId = Get.arguments[1];
    final MovieCreditsController controller = Get.find();
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
                futureBuilder: () => movieItemController.getMovieData(id),
                dataBuilder: (context, snapshot) {
                  MovieDetails data = snapshot.data;
                  return Column(
                    children: [
                      Hero(
                        tag: posterId,
                        child: Card(
                          child: OctoImage(
                            image: CachedNetworkImageProvider(
                                'https://image.tmdb.org/t/p/w500/${data.posterPath}'),
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
                      AutoSizeText('${data.overview}'),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: AutoSizeText(
                          'Release date: ${data.releaseDate}',
                        ),
                      ),
                    ],
                  );
                },
              ),
              // change this to new method!
              Padding(
                padding: const EdgeInsets.all(Paddings.allPaddings),
                child: Futuristic(
                  futureBuilder: () => controller.getData(id),
                  dataBuilder: (context, snapshot) {
                    List<MovieCreditsCast> cast = snapshot.data.cast;
                    List<MovieCreditsCrew> crew = snapshot.data.crew;
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
                            itemCount: crew.length,
                            itemBuilder: (context, index) {
                              MovieCreditsCrew item = crew[index];
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
                            itemCount: cast.length,
                            itemBuilder: (context, index) {
                              MovieCreditsCast item = cast[index];
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
