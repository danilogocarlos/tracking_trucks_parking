import 'dart:convert';

class UserModel {
  String name;
  UserModel({this.name});

  Map<String, dynamic> toMap() {
    return {'name': name};
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(name: map['name']);
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
