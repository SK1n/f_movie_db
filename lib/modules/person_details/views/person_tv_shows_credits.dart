import 'package:auto_size_text/auto_size_text.dart';
import 'package:f_movie_db/data/model/person_tv_shows_credits/person_tv_shows_credits.dart';
import 'package:f_movie_db/data/model/person_tv_shows_credits/person_tv_shows_credits_cast.dart';
import 'package:f_movie_db/data/model/person_tv_shows_credits/person_tv_shows_credits_crew.dart';
import 'package:f_movie_db/modules/person_details/controllers/person_tv_shows_credits_controller.dart';
import 'package:f_movie_db/routes/app_routes.dart';
import 'package:f_movie_db/widgets/carousell_title.dart';
import 'package:f_movie_db/widgets/futuristic.dart';
import 'package:f_movie_db/widgets/carousell_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension RemoveItems on List {
  removeItems() {
    removeWhere((element) => element.posterPath == null);
  }
}

class PersonTvShowsCreditsView extends StatelessWidget {
  final int id;
  const PersonTvShowsCreditsView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    PersonTvShowsCreditsController tvShowsCreditsController = Get.find();
    return Futuristic(
      futureBuilder: () => tvShowsCreditsController.getData(id),
      dataBuilder: (context, snapshot) {
        PersonTvShowsCredits item = snapshot.data;
        List<PersonTvShowsCreditsCast>? cast = item.cast!.removeItems();
        return Column(
          children: [
            cast != null
                ? cast.isNotEmpty
                    ? Column(
                        children: [
                          const CarousellTitle(
                            title: 'Tv Shows Credits',
                            showArrow: false,
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
                                    onTap: (() {
                                      Get.toNamed(Routes.tvShowsDetails,
                                          arguments: [cast[index].id]);
                                    }),
                                    child: Card(
                                      child: Stack(
                                        alignment:
                                            AlignmentDirectional.bottomCenter,
                                        children: [
                                          CarousellImageWidget(
                                              condition:
                                                  cast[index].posterPath !=
                                                      null,
                                              link:
                                                  cast[index].posterPath ?? ''),
                                          Container(
                                            color: Colors.black87,
                                            width: Get.width / 2,
                                            height: 50,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
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
                    : Container()
                : Container(),
          ],
        );
      },
    );
  }
}
