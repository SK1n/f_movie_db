class TvShowsDetailsCreatedBy {
  num? id;
  String? creditId;
  String? name;
  num? gender;
  String? profilePath;

  TvShowsDetailsCreatedBy(
      {this.id, this.creditId, this.name, this.gender, this.profilePath});

  TvShowsDetailsCreatedBy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    creditId = json['credit_id'];
    name = json['name'];
    gender = json['gender'];
    profilePath = json['profile_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['credit_id'] = creditId;
    data['name'] = name;
    data['gender'] = gender;
    data['profile_path'] = profilePath;
    return data;
  }
}
