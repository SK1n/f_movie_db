import 'package:f_movie_db/widgets/custom_app_bar/views/custom_app_bar.dart';
import 'package:f_movie_db/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootView extends GetView {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: GetRouterOutlet(
        initialRoute: Routes.home,
        delegate: GetDelegate(),
        anchorRoute: '/',
        key: Get.key,
      ),
    );
  }
}
