import 'package:f_movie_db/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  const CustomAppBar({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('TMovies'),
      centerTitle: true,
      leading: Get.currentRoute == Routes.home
          ? Container()
          : InkWell(
              child: const Icon(Icons.arrow_back_ios_new),
              onTap: () {
                Get.back();
              },
            ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
