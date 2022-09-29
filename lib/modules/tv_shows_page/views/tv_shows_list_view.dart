import 'package:auto_size_text/auto_size_text.dart';
import 'package:f_movie_db/core/utils/paddings.dart';
import 'package:f_movie_db/data/model/tv_shows/tv_shows_results.dart';
import 'package:f_movie_db/routes/app_routes.dart';
import 'package:f_movie_db/widgets/custom_app_bar/controllers/custom_app_bar_controller.dart';
import 'package:f_movie_db/widgets/carousell_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TvShowsListView extends StatelessWidget {
  final List<TvShowsResults> list;
  final String title;
  const TvShowsListView({
    super.key,
    required this.list,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    CustomAppBarController appBarController = Get.put(CustomAppBarController());
    return Column(
      children: [
        const Divider(
          thickness: 1.0,
          height: 10,
        ),
        SizedBox(
          height: 200,
          width: Get.width - Paddings.allPaddings * 2,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index) {
              TvShowsResults item = list[index];
              return SizedBox(
                width: 100,
                child: InkWell(
                  onTap: (() {
                    appBarController.title = item.name;
                    Get.toNamed(Routes.tvShowsDetails,
                        arguments: [item.id, item.name]);
                  }),
                  child: Card(
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        CarousellImageWidget(link: item.posterPath!),
                        Container(
                          color: Colors.black87,
                          width: Get.width / 2,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AutoSizeText(
                              '${item.name}',
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
    );
  }
}
