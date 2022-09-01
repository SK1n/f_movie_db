import 'package:f_movie_db/modules/root/controllers/root_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RootView extends GetView<RootController> {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetRouterOutlet(
        initialRoute: '/',
        delegate: GetDelegate(),
        anchorRoute: '/',
      ),
    );
  }
}
