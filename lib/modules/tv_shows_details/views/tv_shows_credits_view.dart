import 'package:auto_size_text/auto_size_text.dart';
import 'package:f_movie_db/data/model/tv_shows_credits/tv_shows_credits.dart';
import 'package:f_movie_db/data/model/tv_shows_credits/tv_shows_credits_cast.dart';
import 'package:f_movie_db/modules/tv_shows_details/controllers/tv_shows_credits_controller.dart';
import 'package:f_movie_db/routes/app_routes.dart';
import 'package:f_movie_db/widgets/carousell_image_widget.dart';
import 'package:f_movie_db/widgets/futuristic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TvShowsCreditsView extends StatelessWidget {
  final int id;
  const TvShowsCreditsView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    TvShowsCreditsController controller = Get.find();
    return Futuristic(
      futureBuilder: () => controller.getData(id),
      dataBuilder: (context, snapshot) {
        TvShowsCredits item = snapshot.data;
        List<TvShowsCreditsCast>? cast = item.cast;

        return cast != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Actors'),
                  ),
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
                            onTap: (() => Get.toNamed(Routes.personDetails,
                                arguments: [cast[index].id])),
                            child: Card(
                              child: Stack(
                                alignment: AlignmentDirectional.bottomCenter,
                                children: [
                                  CarousellImageWidget(
                                      link: cast[index].profilePath),
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
            : Container();
      },
    );
  }
}
