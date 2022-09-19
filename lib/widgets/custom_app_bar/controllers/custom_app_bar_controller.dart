import 'package:get/get.dart';

class CustomAppBarController extends GetxController {
  final _title = 'Home'.obs;
  get title => _title.value;
  set title(value) => _title.value = value;
}
