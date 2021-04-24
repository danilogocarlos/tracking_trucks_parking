import 'dart:convert';

class DriverModel {
  String name;
  String photo;

  DriverModel({
    this.name,
    this.photo,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'photo': photo,
    };
  }

  factory DriverModel.fromMap(Map<String, dynamic> map) {
    return DriverModel(
      name: map['name'],
      photo: map['photo'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DriverModel.fromJson(String source) =>
      DriverModel.fromMap(json.decode(source));
}
