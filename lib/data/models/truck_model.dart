import 'dart:convert';

import 'package:tracking_trucks_parking/data/models/checkin_model.dart';
import 'package:tracking_trucks_parking/data/models/driver_model.dart';

class TruckModel {
  String model;
  String plate;
  String photo;
  bool available;
  DriverModel driver;
  List<CheckinModel> checkins;

  TruckModel({
    this.model,
    this.plate,
    this.photo,
    this.available,
    this.driver,
    this.checkins,
  });

  Map<String, dynamic> toMap() {
    return {
      'model': model,
      'plate': plate,
      'photo': photo,
      'available': available,
      'driver': driver.toMap(),
      'checkins': checkins?.map((x) => x.toMap())?.toList(),
    };
  }

  factory TruckModel.fromMap(Map<String, dynamic> map) {
    return TruckModel(
      model: map['model'],
      plate: map['plate'],
      photo: map['photo'],
      available: map['available'],
      driver: DriverModel.fromMap(map['driver']),
      checkins: map.containsKey('checkins')
          ? List<CheckinModel>.from(
              map['checkins']?.map((x) => CheckinModel.fromMap(x)))
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory TruckModel.fromJson(String source) =>
      TruckModel.fromMap(json.decode(source));
}
