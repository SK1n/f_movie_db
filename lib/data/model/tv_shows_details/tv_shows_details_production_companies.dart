class TvShowsDetailsProductionCompanies {
  num? id;
  String? logoPath;
  String? name;
  String? originCountry;

  TvShowsDetailsProductionCompanies(
      {this.id, this.name, this.logoPath, this.originCountry});

  TvShowsDetailsProductionCompanies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    originCountry = json['origin_country'];
    logoPath = json['logo_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['logo_path'] = logoPath;
    data['origin_country'] = originCountry;
    return data;
  }
}
