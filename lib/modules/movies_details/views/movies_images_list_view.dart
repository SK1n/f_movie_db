import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:f_movie_db/data/model/movie_credits/movie_credits.dart';
import 'package:f_movie_db/data/model/movie_credits/movie_credits_cast.dart';
import 'package:f_movie_db/data/model/movies_images/movies_images.dart';
import 'package:f_movie_db/data/model/movies_images/movies_images_logos.dart';
import 'package:f_movie_db/data/model/movies_images/movies_images_posters.dart';
import 'package:f_movie_db/modules/movies_details/controllers/movie_credits_controller.dart';
import 'package:f_movie_db/modules/movies_details/controllers/movies_images_controller.dart';
import 'package:f_movie_db/routes/app_routes.dart';
import 'package:f_movie_db/widgets/futuristic.dart';
import 'package:f_movie_db/widgets/carousell_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:get/get.dart';

//remove items which has no profile picture for a better looking UI

class MoviesImagesListView extends StatelessWidget {
  final int id;
  const MoviesImagesListView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    MoviesImagesController controller = Get.find();
    return Futuristic(
      futureBuilder: () => controller.getData(id),
      dataBuilder: (context, snapshot) {
        MoviesImages item = snapshot.data;
        List<MoviesImagesBackdrops>? backdrops = item.backdrops;
        List<MoviesImagesPosters>? posters = item.posters;
        return Column(
          children: [
            backdrops != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Backdrops'),
                      ),
                      CarouselSlider.builder(
                        itemBuilder: (context, index, realIndex) {
                          return CarousellImageWidget(
                              link: backdrops[index].filePath);
                        },
                        itemCount: backdrops.length,
                        options: CarouselOptions(
                          autoPlay: true,
                        ),
                      ),
                    ],
                  )
                : Container(),
            posters != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Posters'),
                      ),
                      CarouselSlider.builder(
                        itemBuilder: (context, index, realIndex) {
                          return CarousellImageWidget(
                              link: posters[index].filePath);
                        },
                        itemCount: posters.length,
                        options: CarouselOptions(
                          autoPlay: true,
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
