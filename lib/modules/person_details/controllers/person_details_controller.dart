import 'package:f_movie_db/data/model/person_details/person_details.dart';
import 'package:f_movie_db/data/services/person_details_client.dart';
import 'package:get/get.dart';

class PersonDetailsController extends GetxController {
  final PersonDetailsClient client;
  PersonDetailsController(this.client);

  Future<PersonDetails> getData(personId) async {
    client.id = personId;
    return await client.getData();
  }

  String textBirthdayDeathday(String? birthday, String? deathday) {
    if (birthday != null) {
      if (deathday != null) {
        return '$birthday / $deathday';
      } else {
        return birthday;
      }
    }
    return '';
  }

  String textBiography(String? biography) {
    return biography ?? '';
  }
}
