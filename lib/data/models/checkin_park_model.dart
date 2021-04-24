import 'dart:convert';

import 'package:tracking_trucks_parking/data/models/truck_model.dart';

class CheckinParkModel {
  TruckModel truck;
  String timeIn;
  String timeOut;

  CheckinParkModel({
    this.truck,
    this.timeIn,
    this.timeOut,
  });

  Map<String, dynamic> toMap() {
    return {
      'truck': truck.toMap(),
      'time_in': timeIn,
      'time_out': timeOut,
    };
  }

  factory CheckinParkModel.fromMap(Map<String, dynamic> map) {
    return CheckinParkModel(
      truck: TruckModel.fromMap(map['truck']),
      timeIn: map['time_in'],
      timeOut: map['time_out'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CheckinParkModel.fromJson(String source) =>
      CheckinParkModel.fromMap(json.decode(source));
}
