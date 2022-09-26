import 'package:f_movie_db/widgets/app_bar/views/main_screen_app_bar_view.dart';
import 'package:f_movie_db/widgets/bottom_navigation_bar/controllers/bottom_navigation_bar_controller.dart';
import 'package:f_movie_db/widgets/bottom_navigation_bar/views/bottom_navigation_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPageUi extends StatelessWidget {
  const MainPageUi({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavigationBarController controller = Get.find();
    return Scaffold(
      bottomNavigationBar: const BottomNavigationBarView(),
      body: CustomScrollView(slivers: [
        const MainScreenAppBarView(),
        SliverList(
            delegate: SliverChildListDelegate([
          Obx(() => controller.page),
        ]))
      ]),
    );
  }
}
