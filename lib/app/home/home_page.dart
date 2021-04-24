import 'package:flutter/material.dart';
import 'package:tracking_trucks_parking/app/home/home_page_controller.dart';
import 'package:tracking_trucks_parking/app/home/home_state.dart';
import 'package:tracking_trucks_parking/app/home/widgets/app_bar/app_bar_widget.dart';
import 'package:tracking_trucks_parking/app/home/widgets/bottom_nav_bar/bottom_nav_bar_widget.dart';
import 'package:tracking_trucks_parking/app/home/widgets/filters/filters_list_widget.dart';
import 'package:tracking_trucks_parking/app/home/widgets/park_list/park_list_widget.dart';
import 'package:tracking_trucks_parking/app/home/widgets/truck_list/truck_list_widget.dart';

import 'package:tracking_trucks_parking/core/core.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  final controller = HomePageController();
  int currentIdex;
  int currentOption;

  @override
  void initState() {
    super.initState();
    currentIdex = 0;
    currentOption = 0;
    controller.fetchUser();
    controller.fetchTrucks(currentOption);
    controller.fetchParks(currentOption);
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      return Scaffold(
        backgroundColor: AppColors.background,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: AppBarWidget(controller.user),
            ),
            Positioned(
              top: 120,
              left: 0,
              right: 0,
              bottom: 0,
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: FiltersListWidget(
                        selectedOption: currentOption,
                        onTap: (index) => setState(() {
                          if (index != currentOption) {
                            currentOption = index;
                            if (currentIdex == 0) {
                              controller.fetchTrucks(currentOption);
                            } else {
                              controller.fetchParks(currentOption);
                            }
                          }
                        }),
                      )),
                  SizedBox(height: 20),
                  Expanded(
                    child: currentIdex == 0
                        ? TrucksListWidget(trucks: controller.trucks)
                        : ParkListWidget(parks: controller.parks),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.background,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.background,
                      spreadRadius: 10,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomNavBarWidget(
                selectedIndex: currentIdex,
                onTap: (index) => setState(() {
                  currentOption = 0;
                  currentIdex = index;
                  if (index == 0) {
                    controller.fetchTrucks(currentOption);
                  } else {
                    controller.fetchParks(currentOption);
                  }
                }),
              ),
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.green),
          ),
        ),
      );
    }
  }
}
