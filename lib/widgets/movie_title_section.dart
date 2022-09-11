import 'package:auto_size_text/auto_size_text.dart';
import 'package:f_movie_db/core/utils/paddings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieTitleSection extends StatelessWidget {
  final String title;
  const MovieTitleSection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: Paddings.topPaddings, bottom: Paddings.bottomPaddings),
          child: Card(
            child: Container(
              width: Get.width,
              margin: const EdgeInsets.all(Paddings.allPaddings),
              child: const AutoSizeText(
                'POPULAR MOVIES',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: Paddings.rightPaddings),
          child: const Icon(Icons.arrow_forward_sharp),
        )
      ],
    );
  }
}
