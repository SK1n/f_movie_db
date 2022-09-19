import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:f_movie_db/core/const.dart';
import 'package:f_movie_db/data/model/person_movies_credits/person_movies_credits.dart';
import 'package:f_movie_db/data/model/person_movies_credits/person_movies_credits_cast.dart';
import 'package:f_movie_db/data/model/person_movies_credits/person_movies_credits_crew.dart';
import 'package:f_movie_db/modules/person_details/controllers/person_movies_credits_controller.dart';
import 'package:f_movie_db/routes/app_routes.dart';
import 'package:f_movie_db/widgets/carousell_title.dart';
import 'package:f_movie_db/widgets/futuristic.dart';
import 'package:f_movie_db/widgets/carousell_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';

class PersonMoviesCreditsView extends StatelessWidget {
  final int id;
  const PersonMoviesCreditsView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    PersonMoviesCreditsController moviesCreditsController = Get.find();
    return Futuristic(
      futureBuilder: () => moviesCreditsController.getData(id),
      dataBuilder: (context, snapshot) {
        PersonMoviesCredits item = snapshot.data;
        List<PersonMoviesCreditsCast>? cast = item.cast;
        List<PersonMoviesCreditsCrew>? crew = item.crew;
        return Column(
          children: [
            cast!.isNotEmpty || crew!.isNotEmpty
                ? const CarousellTitle(
                    title: 'Movies Credits',
                    showArrow: false,
                  )
                : Container(),
            cast.isNotEmpty
                ? Column(
                    children: [
                      const Text('Cast'),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: cast.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: 100,
                              child: InkWell(
                                onTap: (() {
                                  Get.toNamed(Routes.moviesDetails, arguments: [
                                    cast[index].id,
                                    cast[index].title
                                  ]);
                                }),
                                child: Card(
                                  child: Stack(
                                    alignment:
                                        AlignmentDirectional.bottomCenter,
                                    children: [
                                      CarousellImageWidget(
                                          condition:
                                              cast[index].backdropPath != null,
                                          link: cast[index].backdropPath ?? ''),
                                      Container(
                                        color: Colors.black87,
                                        width: Get.width / 2,
                                        height: 50,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: AutoSizeText(
                                            '${cast[index].title}',
                                            maxLines: 2,
                                            minFontSize: 8,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                : Container(),
            crew!.isNotEmpty
                ? Column(
                    children: [
                      const Text('Crew'),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: crew.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: 100,
                              child: InkWell(
                                onTap: (() {
                                  Get.toNamed(Routes.moviesDetails, arguments: [
                                    crew[index].id,
                                    crew[index].title
                                  ]);
                                }),
                                child: Card(
                                  child: Stack(
                                    alignment:
                                        AlignmentDirectional.bottomCenter,
                                    children: [
                                      CarousellImageWidget(
                                          condition:
                                              crew[index].backdropPath != null,
                                          link: crew[index].backdropPath ?? ''),
                                      Container(
                                        color: Colors.black87,
                                        width: Get.width / 2,
                                        height: 50,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: AutoSizeText(
                                            '${crew[index].title}',
                                            maxLines: 2,
                                            minFontSize: 8,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                : Container(),
          ],
        );
      },
    );
  }
}
