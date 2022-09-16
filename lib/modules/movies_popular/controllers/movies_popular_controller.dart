import 'package:dio/dio.dart';
import 'package:f_movie_db/core/utils/end_points.dart';
import 'package:f_movie_db/data/model/movies_results.dart';
import 'package:f_movie_db/data/services/movies_client.dart';
import 'package:get/get.dart';

class MoviesPopularController extends GetxController {
  Future<List<MoviesResults>> getData(int offset) async {
    var dio = Dio();
    var tempPopular = MoviesClient(
      httpClient: dio,
      endPoint: EndPoints().moviesPopular,
      page: offset ~/ 20 + 1,
    );
    return await tempPopular.getData();
  }
}
