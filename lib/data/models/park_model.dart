import 'dart:convert';

import 'package:tracking_trucks_parking/data/models/checkin_park_model.dart';

class ParkModel {
  String title;
  bool available;
  String lastCheck;
  List<CheckinParkModel> checkins;

  ParkModel({
    this.title,
    this.available,
    this.lastCheck,
    this.checkins,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'available': available,
      'last_check': lastCheck,
      'checkins': checkins?.map((x) => x.toMap())?.toList(),
    };
  }

  factory ParkModel.fromMap(Map<String, dynamic> map) {
    return ParkModel(
      title: map['title'],
      available: map['available'],
      lastCheck: map['last_check'],
      checkins: List<CheckinParkModel>.from(
          map['checkins']?.map((x) => CheckinParkModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ParkModel.fromJson(String source) =>
      ParkModel.fromMap(json.decode(source));
}
