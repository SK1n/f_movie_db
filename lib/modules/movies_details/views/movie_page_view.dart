import 'package:f_movie_db/core/utils/end_points.dart';
import 'package:f_movie_db/data/model/movie_details/movie_details.dart';
import 'package:f_movie_db/modules/movies_details/controllers/movie_item_controller.dart';
import 'package:f_movie_db/modules/movies_details/views/movies_details_credits_view.dart';
import 'package:f_movie_db/widgets/app_bar/views/app_bar_view.dart';
import 'package:f_movie_db/widgets/futuristic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rich_text_view/rich_text_view.dart';

class MoviePageView extends StatelessWidget {
  const MoviePageView({super.key});
  @override
  Widget build(BuildContext context) {
    int id = Get.arguments[0];
    final MovieItemController movieItemController = Get.find();
    return Futuristic(
      futureBuilder: () => movieItemController.getData(id),
      dataBuilder: (context, snapshot) {
        MovieDetails item = snapshot.data;
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              AppBarView(
                title: item.title!,
                id: item.id!,
                releaseDate: item.releaseDate!,
                genres: item.genres!,
                runtime: item.runtime!,
                endPoint: EndPoints(id: item.id).moviesVideosResults,
                posterPath: item.posterPath!,
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
