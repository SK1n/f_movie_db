import 'package:auto_size_text/auto_size_text.dart';
import 'package:f_movie_db/data/model/movie_credits/movie_credits.dart';
import 'package:f_movie_db/data/model/movie_credits/movie_credits_cast.dart';
import 'package:f_movie_db/data/model/movie_credits/movie_credits_crew.dart';
import 'package:f_movie_db/data/model/person_tv_shows_credits/person_tv_shows_credits.dart';
import 'package:f_movie_db/data/model/person_tv_shows_credits/person_tv_shows_credits_cast.dart';
import 'package:f_movie_db/data/model/person_tv_shows_credits/person_tv_shows_credits_crew.dart';
import 'package:f_movie_db/modules/movies_details/controllers/movie_credits_controller.dart';
import 'package:f_movie_db/modules/person_details/controllers/person_tv_shows_credits_controller.dart';
import 'package:f_movie_db/routes/app_routes.dart';
import 'package:f_movie_db/widgets/carousell_title.dart';
import 'package:f_movie_db/widgets/futuristic.dart';
import 'package:f_movie_db/widgets/carousell_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesDetailsCastView extends StatelessWidget {
  final int id;
  const MoviesDetailsCastView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    MovieCreditsController controller = Get.find();
    return Futuristic(
      futureBuilder: () => controller.getData(id),
      dataBuilder: (context, snapshot) {
        MovieCredits item = snapshot.data;
        List<MovieCreditsCast>? cast = item.cast;
        List<MovieCreditsCrew>? crew = item.crew;
        return Column(
          children: [
            cast!.isNotEmpty
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
                                  Get.toNamed(Routes.personDetails,
                                      arguments: [cast[index].id]);
                                }),
                                child: Card(
                                  child: Stack(
                                    alignment:
                                        AlignmentDirectional.bottomCenter,
                                    children: [
                                      CarousellImageWidget(
                                          condition:
                                              cast[index].profilePath != null,
                                          link: cast[index].profilePath ?? ''),
                                      Container(
                                        color: Colors.black87,
                                        width: Get.width / 2,
                                        height: 50,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: AutoSizeText(
                                            '${cast[index].name}',
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
                                  Get.toNamed(Routes.personDetails,
                                      arguments: [crew[index].id]);
                                }),
                                child: Card(
                                  child: Stack(
                                    alignment:
                                        AlignmentDirectional.bottomCenter,
                                    children: [
                                      CarousellImageWidget(
                                          condition:
                                              crew[index].profilePath != null,
                                          link: crew[index].profilePath ?? ''),
                                      Container(
                                        color: Colors.black87,
                                        width: Get.width / 2,
                                        height: 50,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: AutoSizeText(
                                            '${crew[index].name}',
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
