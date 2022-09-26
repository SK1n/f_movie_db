import 'package:f_movie_db/widgets/bottom_navigation_bar/controllers/bottom_navigation_bar_controller.dart';
import 'package:fancy_bottom_navigation_2/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationBarView extends StatelessWidget {
  const BottomNavigationBarView({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavigationBarController controller = Get.find();
    return FancyBottomNavigation(
      tabs: [
        TabData(iconData: Icons.movie_sharp, title: 'Movies'),
        TabData(iconData: Icons.tv_outlined, title: 'TV Shows'),
      ],
      onTabChangedListener: (_) {
        controller.position = _;
      },
    );
  }
}

// import 'package:f_movie_db/widgets/bottom_navigation_bar/controllers/bottom_navigation_bar_controller.dart';
// import 'package:fancy_bottom_navigation_2/fancy_bottom_navigation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class BottomNavigationBarView extends StatelessWidget {
//   const BottomNavigationBarView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     BottomNavigationBarController controller = Get.find();
//     return BottomNavigationBarTheme(
//       data: BottomNavigationBarThemeData(),
//       child: BottomNavigationBar(
//         elevation: 0,
//         items: const [
//           BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.search,
//               ),
//               label: ''),
//           BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.search,
//               ),
//               label: ''),
//           BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.search,
//               ),
//               label: ''),
//           BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.search,
//               ),
//               label: ''),
//         ],
//         type: BottomNavigationBarType.fixed,
//       ),
//     );
//   }
// }

