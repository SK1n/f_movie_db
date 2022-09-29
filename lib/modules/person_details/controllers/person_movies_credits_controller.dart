import 'package:f_movie_db/data/model/person_movies_credits/person_movies_credits.dart';
import 'package:f_movie_db/data/services/person_movies_credits_client.dart';
import 'package:get/get.dart';

class PersonMoviesCreditsController extends GetxController {
  final PersonMoviesCreditsClient client;
  PersonMoviesCreditsController(this.client);

  Future<PersonMoviesCredits> getData(id) async {
    return await client.getData(id);
  }
}
