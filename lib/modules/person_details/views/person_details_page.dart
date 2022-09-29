import 'package:f_movie_db/data/model/person_details/person_details.dart';
import 'package:f_movie_db/modules/person_details/controllers/person_details_controller.dart';
import 'package:f_movie_db/modules/person_details/views/person_movies_credits_view.dart';
import 'package:f_movie_db/modules/person_details/views/person_tv_shows_credits.dart';
import 'package:f_movie_db/widgets/custom_app_bar/views/custom_app_bar.dart';
import 'package:f_movie_db/widgets/futuristic.dart';
import 'package:f_movie_db/widgets/person_avatar_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonDetailsPage extends StatelessWidget {
  const PersonDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    int id = Get.arguments[0];
    PersonDetailsController personDetailsController = Get.find();
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Futuristic(
                futureBuilder: (() => personDetailsController.getData(id)),
                dataBuilder: (context, snapshot) {
                  PersonDetails item = snapshot.data;
                  return Column(
                    children: [
                      PersonAvatarImageWidget(link: item.profilePath),
                      Text(
                        item.name ?? 'No name found!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: context.textTheme.displayMedium!.fontSize,
                        ),
                      ),
                      Text(
                        personDetailsController.textBirthdayDeathday(
                            item.birthday, item.deathday),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          item.biography ?? '',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: context.textTheme.bodySmall!.fontSize,
                          ),
                        ),
                      ),
                      PersonMoviesCreditsView(id: id),
                      PersonTvShowsCreditsView(id: id),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
