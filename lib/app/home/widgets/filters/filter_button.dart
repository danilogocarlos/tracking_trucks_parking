import 'package:flutter/material.dart';
import 'package:tracking_trucks_parking/core/core.dart';

class FilterButton extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color fontColor;
  final Color borderColor;
  final Function onTap;

  const FilterButton({
    Key key,
    this.label,
    this.onTap,
    this.backgroundColor,
    this.fontColor,
    this.borderColor,
  }) : super(key: key);

  FilterButton.blue({String label, VoidCallback onTap})
      : this.backgroundColor = AppColors.blue,
        this.fontColor = AppColors.white,
        this.borderColor = AppColors.blue,
        this.label = label,
        this.onTap = onTap;

  FilterButton.magenta({String label, VoidCallback onTap})
      : this.backgroundColor = Colors.transparent,
        this.fontColor = AppColors.magentaLight,
        this.borderColor = AppColors.magentaLight,
        this.label = label,
        this.onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Chip(
        backgroundColor: backgroundColor,
        label: Text(
          label,
          style: AppTextStyles.description.copyWith(color: fontColor),
        ),
        shape: StadiumBorder(side: BorderSide(color: borderColor, width: 1)),
        labelPadding: EdgeInsets.symmetric(horizontal: 2.0),
        padding: EdgeInsets.symmetric(horizontal: 10.0),
      ),
    );
  }
}
