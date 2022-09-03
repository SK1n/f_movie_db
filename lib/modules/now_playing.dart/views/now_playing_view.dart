import 'package:f_movie_db/global_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class NowPlayingView extends StatelessWidget {
  const NowPlayingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Now Playing',
      ),
      body: Container(
        child: const Text('hello!'),
      ),
    );
  }
}
