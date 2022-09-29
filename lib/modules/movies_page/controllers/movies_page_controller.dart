import 'package:f_movie_db/core/utils/end_points.dart';
import 'package:f_movie_db/data/services/movies_client.dart';
import 'package:get/get.dart';

class MoviesPageController extends GetxController {
  final MoviesClient client;
  MoviesPageController(this.client);

  Future getNowPlayingData() async {
    return await client.getData(EndPoints().moviesNowPlaying);
  }

  Future getUpcomingData() async {
    return await client.getData(EndPoints().moviesUpcoming);
  }

  Future getPopularData() async {
    return await client.getData(EndPoints().moviesPopular);
  }
}

// class MoviesPageController extends GetxController {
//   final _nowPlaying = <MoviesResults>[].obs;
//   get nowPlaying => _nowPlaying;
//   set nowPlaying(value) => _nowPlaying.value = value;

//   final _popular = <MoviesResults>[].obs;
//   get popular => _popular;
//   set popular(value) => _popular.value = value;

//   final _upcoming = <MoviesResults>[].obs;
//   get upcoming => _upcoming;
//   set upcoming(value) => _upcoming.value = value;

//   getData() async {
//     var dio = Dio();
//     var tempNowPlaying =
//         MoviesClient(httpClient: dio, endPoint: EndPoints().moviesNowPlaying);
//     var tempPopular =
//         MoviesClient(httpClient: dio, endPoint: EndPoints().moviesPopular);
//     var tempUpcoming =
//         MoviesClient(httpClient: dio, endPoint: EndPoints().moviesUpcoming);
//     nowPlaying.addAll(await tempNowPlaying.getAll());
//     popular.addAll(await tempPopular.getAll());
//     upcoming.addAll(await tempUpcoming.getAll());
//   }

//   int get lengthPopular => popular.length;
//   int get lengthUpcoming => upcoming.length;
//   int get lengthNowPlaying => nowPlaying.length;
// }
