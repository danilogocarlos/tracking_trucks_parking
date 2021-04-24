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
  final _controller = HomePageController();
  int _currentIdex;
  int _currentOption;

  @override
  void initState() {
    super.initState();
    _currentIdex = 0;
    _currentOption = 0;
    _controller.fetchUser();
    _controller.fetchTrucks(_currentOption);
    _controller.fetchParks(_currentOption);
    _controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_controller.state == HomeState.success) {
      return Scaffold(
        backgroundColor: AppColors.background,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: AppBarWidget(_controller.user),
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
                        selectedOption: _currentOption,
                        onTap: (index) => setState(() {
                          if (index != _currentOption) {
                            _currentOption = index;
                            if (_currentIdex == 0) {
                              _controller.fetchTrucks(_currentOption);
                            } else {
                              _controller.fetchParks(_currentOption);
                            }
                          }
                        }),
                      )),
                  SizedBox(height: 20),
                  Expanded(
                    child: _currentIdex == 0
                        ? TrucksListWidget(trucks: _controller.trucks)
                        : ParkListWidget(parks: _controller.parks),
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
                selectedIndex: _currentIdex,
                onTap: (index) => setState(() {
                  _currentOption = 0;
                  _currentIdex = index;
                  if (index == 0) {
                    _controller.fetchTrucks(_currentOption);
                  } else {
                    _controller.fetchParks(_currentOption);
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
