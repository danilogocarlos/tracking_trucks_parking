import 'package:flutter/material.dart';
import 'package:tracking_trucks_parking/core/core.dart';

class BackToListWidget extends StatelessWidget {
  const BackToListWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: AppColors.blue,
      ),
      child: TextButton(
        onPressed: () => Navigator.pop(context),
        child: Text(
          "Voltar para a lista",
          style: AppTextStyles.paragraphBold.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
