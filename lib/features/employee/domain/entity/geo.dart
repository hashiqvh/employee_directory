import '../../data/model/geo_model.dart';

class Geo extends GeoModel {
  Geo({
    this.lat,
    this.lng,
  }) : super(
          lat: lat,
          lng: lng,
        );

  String lat;
  String lng;
}
