import 'package:flutter/widgets.dart';
import 'package:tracking_trucks_parking/app/home/home_repository.dart';
import 'package:tracking_trucks_parking/app/home/home_state.dart';
import 'package:tracking_trucks_parking/data/models/park_model.dart';
import 'package:tracking_trucks_parking/data/models/truck_model.dart';
import 'package:tracking_trucks_parking/data/models/user_model.dart';

class HomePageController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  List<TruckModel> trucks;
  List<ParkModel> parks;
  UserModel user;

  final repository = HomeRepository();

  fetchUser() async {
    state = HomeState.loading;
    user = await repository.getUser();
    if (trucks != null && parks != null) state = HomeState.success;
  }

  fetchTrucks(int index) async {
    state = HomeState.loading;
    switch (index) {
      case 0:
        trucks = await repository.getAllTrucks();
        break;
      case 1:
        trucks = await repository.getAvailableTrucks();
        break;
      default:
        trucks = await repository.getBusyTrucks();
        break;
    }
    state = HomeState.success;
  }

  fetchParks(int index) async {
    state = HomeState.loading;
    switch (index) {
      case 0:
        parks = await repository.getAllParks();
        break;
      case 1:
        parks = await repository.getAvailableParks();
        break;
      default:
        parks = await repository.getBusyParks();
        break;
    }
    state = HomeState.success;
  }
}
