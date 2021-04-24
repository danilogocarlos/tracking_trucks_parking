import 'dart:convert';

class CheckinModel {
  String park;
  String timeIn;
  String timeOut;

  CheckinModel({
    this.park,
    this.timeIn,
    this.timeOut,
  });

  Map<String, dynamic> toMap() {
    return {
      'park': park,
      'time_in': timeIn,
      'time_out': timeOut,
    };
  }

  factory CheckinModel.fromMap(Map<String, dynamic> map) {
    return CheckinModel(
      park: map['park'],
      timeIn: map['time_in'],
      timeOut: map['time_out'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CheckinModel.fromJson(String source) =>
      CheckinModel.fromMap(json.decode(source));
}
