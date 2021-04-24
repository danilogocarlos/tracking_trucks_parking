import 'package:flutter/material.dart';
import 'package:tracking_trucks_parking/core/core.dart';

class BottomNavBarButtonwidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  final IconData icon;

  const BottomNavBarButtonwidget({
    Key key,
    this.title,
    this.isSelected,
    this.onTap,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: isSelected ? AppColors.magenta : AppColors.white,
      ),
      child: TextButton(
        style: _clearButtonStyle(),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 24,
              color: isSelected ? Colors.white : AppColors.magentaLight,
            ),
            SizedBox(width: 8),
            Text(
              title,
              style: AppTextStyles.paragraphBold.copyWith(
                color: isSelected ? Colors.white : AppColors.magentaLight,
              ),
            ),
          ],
        ),
      ),
    );
  }

  ButtonStyle _clearButtonStyle() {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
      overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
      shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
    );
  }
}
