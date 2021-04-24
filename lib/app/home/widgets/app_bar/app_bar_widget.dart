import 'package:flutter/material.dart';
import 'package:tracking_trucks_parking/core/core.dart';
import 'package:tracking_trucks_parking/data/models/user_model.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget(UserModel user)
      : super(
          preferredSize: Size(double.maxFinite, 120),
          child: Container(
            height: 120,
            padding: EdgeInsets.fromLTRB(24, 48, 24, 0),
            child: Text(
              "Olá, ${user.name}",
              style: AppTextStyles.title.copyWith(color: AppColors.magentaDark),
            ),
          ),
        );
}
