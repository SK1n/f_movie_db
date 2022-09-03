import 'package:auto_size_text/auto_size_text.dart';
import 'package:f_movie_db/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({super.key, this.title = 'FMovies DB'});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: AutoSizeText(
        title,
        maxLines: 2,
        textAlign: TextAlign.center,
      ),
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      leading: Get.currentRoute == Routes.home
          ? Container()
          : InkWell(
              child: const Icon(Icons.arrow_back_ios_new),
              onTap: () => Get.back(),
            ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
