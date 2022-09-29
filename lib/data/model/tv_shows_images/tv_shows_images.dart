import 'package:f_movie_db/data/model/movies_images/movies_images_logos.dart';
import 'package:f_movie_db/data/model/movies_images/movies_images_posters.dart';
import 'package:f_movie_db/data/model/tv_shows_images/tv_shows_images_logos.dart';
import 'package:f_movie_db/data/model/tv_shows_images/tv_shows_images_posters.dart';

class TvShowsImages {
  List<TvShowsImagesBackdrops>? backdrops;
  int? id;
  List<TvShowsImagesLogos>? logos;
  List<TvShowsImagesPosters>? posters;

  TvShowsImages({this.backdrops, this.id, this.logos, this.posters});

  TvShowsImages.fromJson(Map<String, dynamic> json) {
    if (json['backdrops'] != null) {
      backdrops = <TvShowsImagesBackdrops>[];
      json['backdrops'].forEach((v) {
        backdrops!.add(TvShowsImagesBackdrops.fromJson(v));
      });
    }
    id = json['id'];
    if (json['logos'] != null) {
      logos = <TvShowsImagesLogos>[];
      json['logos'].forEach((v) {
        logos!.add(TvShowsImagesLogos.fromJson(v));
      });
    }
    if (json['posters'] != null) {
      posters = <TvShowsImagesPosters>[];
      json['posters'].forEach((v) {
        posters!.add(TvShowsImagesPosters.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (backdrops != null) {
      data['backdrops'] = backdrops!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    if (logos != null) {
      data['logos'] = logos!.map((v) => v.toJson()).toList();
    }
    if (posters != null) {
      data['posters'] = posters!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TvShowsImagesBackdrops {
  double? aspectRatio;
  num? height;
  String? iso6391;
  String? filePath;
  double? voteAverage;
  num? voteCount;
  num? width;

  TvShowsImagesBackdrops(
      {this.aspectRatio,
      this.height,
      this.iso6391,
      this.filePath,
      this.voteAverage,
      this.voteCount,
      this.width});

  TvShowsImagesBackdrops.fromJson(Map<String, dynamic> json) {
    aspectRatio = json['aspect_ratio'];
    height = json['height'];
    iso6391 = json['iso_639_1'];
    filePath = json['file_path'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['aspect_ratio'] = aspectRatio;
    data['height'] = height;
    data['iso_639_1'] = iso6391;
    data['file_path'] = filePath;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    data['width'] = width;
    return data;
  }
}
