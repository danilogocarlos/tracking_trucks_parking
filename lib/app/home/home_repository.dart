import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:tracking_trucks_parking/data/models/park_model.dart';
import 'package:tracking_trucks_parking/data/models/truck_model.dart';
import 'package:tracking_trucks_parking/data/models/user_model.dart';

class HomeRepository {
  Future<UserModel> getUser() async {
    final response = await rootBundle.loadString("database/user.json");
    final user = UserModel.fromJson(response);
    return user;
  }

  Future<List<TruckModel>> getAllTrucks() async {
    final response = await rootBundle.loadString("database/trucks.json");
    final list = jsonDecode(response) as List;
    final trucks = list.map((truck) => TruckModel.fromMap(truck)).toList();
    return trucks;
  }

  Future<List<TruckModel>> getAvailableTrucks() async {
    final response = await rootBundle.loadString("database/trucks.json");
    final list = jsonDecode(response) as List;
    final trucks = list
        .map((truck) => truck['available'] ? TruckModel.fromMap(truck) : null)
        .where((truck) => truck != null)
        .toList();
    return trucks;
  }

  Future<List<TruckModel>> getBusyTrucks() async {
    final response = await rootBundle.loadString("database/trucks.json");
    final list = jsonDecode(response) as List;
    final trucks = list
        .map((truck) => truck['available'] ? null : TruckModel.fromMap(truck))
        .where((truck) => truck != null)
        .toList();
    return trucks;
  }

  Future<List<ParkModel>> getAllParks() async {
    final response = await rootBundle.loadString("database/parks.json");
    final list = jsonDecode(response) as List;
    final parks = list.map((park) => ParkModel.fromMap(park)).toList();
    return parks;
  }

  Future<List<ParkModel>> getAvailableParks() async {
    final response = await rootBundle.loadString("database/parks.json");
    final list = jsonDecode(response) as List;
    final parks = list
        .map((park) => park['available'] ? ParkModel.fromMap(park) : null)
        .where((park) => park != null)
        .toList();
    return parks;
  }

  Future<List<ParkModel>> getBusyParks() async {
    final response = await rootBundle.loadString("database/parks.json");
    final list = jsonDecode(response) as List;
    final parks = list
        .map((park) => park['available'] ? null : ParkModel.fromMap(park))
        .where((park) => park != null)
        .toList();
    return parks;
  }
}
