class MoviesDates {
  String? maximum;
  String? minimum;

  MoviesDates({this.maximum, this.minimum});

  MoviesDates.fromJson(Map<String, dynamic> json) {
    maximum = json['maximum'];
    minimum = json['minimum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maximum'] = maximum;
    data['minimum'] = minimum;
    return data;
  }
}
