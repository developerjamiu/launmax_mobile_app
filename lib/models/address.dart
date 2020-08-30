import 'package:cloud_firestore/cloud_firestore.dart';

class Address {
  static const field_description = 'description';
  static const field_state = 'state';
  static const field_country = 'country';
  static const field_geoPoint = 'geoPoint';

  String description;
  String state;
  String country;
  GeoPoint geoPoint;

  Address({
    this.description,
    this.state,
    this.country,
    this.geoPoint,
  });

  Map<String, dynamic> toJson() {
    return {
      field_description: description,
      field_state: state,
      field_country: country,
      field_geoPoint: geoPoint,
    };
  }
}
