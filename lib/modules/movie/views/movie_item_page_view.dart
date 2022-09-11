import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:f_movie_db/core/utils/paddings.dart';
import 'package:f_movie_db/data/model/cast.dart';
import 'package:f_movie_db/data/model/crew.dart';
import 'package:f_movie_db/data/model/results.dart';
import 'package:f_movie_db/widgets/custom_app_bar.dart';
import 'package:f_movie_db/widgets/futuristic.dart';
import 'package:f_movie_db/modules/movie/controllers/person_item_controller.dart';
import 'package:f_movie_db/widgets/cast_item_view.dart';
import 'package:f_movie_db/widgets/crew_item_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';

class MovieItemPageView extends StatelessWidget {
  const MovieItemPageView({super.key});
  @override
  Widget build(BuildContext context) {
    Results item = Get.arguments[0];
    int id = Get.arguments[1];
    final PersonItemController controller = Get.find();
    return Scaffold(
      appBar: CustomAppBar(
        title: '${item.title}',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Paddings.allPaddings),
          child: Column(
            children: [
              Hero(
                tag: 'poster${item.id}$id',
                child: Card(
                  child: OctoImage(
                    image: CachedNetworkImageProvider(
                        'https://image.tmdb.org/t/p/w500/${item.posterPath}'),
                    placeholderBuilder: OctoPlaceholder.blurHash(
                      'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                    ),
                    width: Get.width,
                    height: 192,
                    errorBuilder: OctoError.icon(color: Colors.red),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Paddings.allPaddings),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText('${item.overview}'),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: AutoSizeText(
                        'Release date: ${item.releaseDate}',
                      ),
                    ),
                    Futuristic(
                      futureBuilder: () => controller.getData(item.id),
                      useQuery: false,
                      dataBuilder: (p0, p1) {
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
                                itemCount: controller.lengthCrew,
                                itemBuilder: (context, index) {
                                  Crew item = controller.crew[index];
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
                                itemCount: controller.lengthCast,
                                itemBuilder: (context, index) {
                                  Cast item = controller.cast[index];
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
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
