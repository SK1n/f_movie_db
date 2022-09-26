// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:f_movie_db/modules/main_screen/views/main_page_view.dart';
import 'package:f_movie_db/routes/app_routes.dart';
import 'package:f_movie_db/widgets/bottom_navigation_bar/controllers/bottom_navigation_bar_controller.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:get/get.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MainPageUi());
    Get.put(BottomNavigationBarController());
    Get.toNamed(Routes.moviesDetails, arguments: [2332]);
    expect(find.text('Play video'), findsOneWidget);
  });
}
