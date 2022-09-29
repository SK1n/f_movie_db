import 'package:dio/dio.dart';
import 'package:f_movie_db/data/services/videos_client.dart';
import 'package:f_movie_db/widgets/app_bar/controllers/app_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreenAppBarView extends StatelessWidget {
  const MainScreenAppBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AppBarController controller = Get.put(AppBarController(VideosClient()));
    return SliverAppBar(
      expandedHeight: 100,
      floating: false,
      pinned: true,
      title: SizedBox(
        width: Get.width,
        height: 40,
        child: const ListTile(
          trailing: Icon(Icons.search),
          title: TextField(
            decoration: InputDecoration(hintText: 'Search...'),
          ),
        ),
      ),
      flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        controller.biggest = constraints.biggest.height;
        return controller.biggest > 120
            ? Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Positioned(
                    bottom: 0,
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text('Movies'),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Tv Shows'),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Container();
      }),
    );
  }
}
