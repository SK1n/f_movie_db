import 'package:f_movie_db/core/utils/end_points.dart';
import 'package:f_movie_db/data/services/movies_client.dart';
import 'package:get/get.dart';

class MoviesController extends GetxController {
  final MoviesClient client;
  MoviesController(this.client);

  Future getNowPlayingData() async {
    client.endPoint = EndPoints().moviesNowPlaying;
    var data = await client.getData();
    return data;
  }

  Future getUpcomingData() async {
    client.endPoint = EndPoints().moviesUpcoming;
    var data = await client.getData();
    return data;
  }

  Future getPopularData() async {
    client.endPoint = EndPoints().moviesPopular;
    var data = await client.getData();
    return data;
  }
}

// class MoviesController extends GetxController {
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
