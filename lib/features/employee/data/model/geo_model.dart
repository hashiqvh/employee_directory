class GeoModel {
  GeoModel({
    this.lat,
    this.lng,
  });

  String lat;
  String lng;

  factory GeoModel.fromJson(Map<String, dynamic> json) => GeoModel(
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}
