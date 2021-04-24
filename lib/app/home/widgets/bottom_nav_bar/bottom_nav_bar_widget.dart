import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:tracking_trucks_parking/app/home/widgets/bottom_nav_bar/bottom_nav_bar_button_widget.dart';
import 'package:tracking_trucks_parking/core/core.dart';

class BottomNavBarWidget extends StatelessWidget {
  final int selectedIndex;
  final Function onTap;
  const BottomNavBarWidget({
    Key key,
    this.selectedIndex,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(24.0),
      padding: EdgeInsets.all(8.0),
      height: 64,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 3,
            blurRadius: 24,
            offset: Offset(0, 7),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: BottomNavBarButtonwidget(
              title: "Caminhões",
              icon: Feather.truck,
              isSelected: selectedIndex == 0,
              onTap: () => onTap(0),
            ),
          ),
          SizedBox(width: 9),
          Expanded(
            child: BottomNavBarButtonwidget(
              title: "Vagas",
              icon: Feather.map_pin,
              isSelected: selectedIndex == 1,
              onTap: () => onTap(1),
            ),
          ),
        ],
      ),
    );
  }
}
