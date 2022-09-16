class TvShowsDetailsProductionCountries {
  String? iso31661;
  String? name;

  TvShowsDetailsProductionCountries({this.iso31661, this.name});

  TvShowsDetailsProductionCountries.fromJson(Map<String, dynamic> json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['iso_3166_1'] = iso31661;
    data['name'] = name;
    return data;
  }
}
