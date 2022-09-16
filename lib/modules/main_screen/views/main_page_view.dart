import 'package:f_movie_db/widgets/bottom_navigation_bar/controllers/bottom_navigation_bar_controller.dart';
import 'package:f_movie_db/widgets/bottom_navigation_bar/views/bottom_navigation_bar_view.dart';
import 'package:f_movie_db/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPageUi extends StatelessWidget {
  const MainPageUi({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavigationBarController controller = Get.find();
    return Scaffold(
      appBar: const CustomAppBar(title: 'Home'),
      bottomNavigationBar: const BottomNavigationBarView(),
      body: Obx(() => controller.page),
    );
  }
}
