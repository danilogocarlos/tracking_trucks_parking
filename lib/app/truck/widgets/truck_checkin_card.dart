import 'package:flutter/material.dart';
import 'package:tracking_trucks_parking/core/core.dart';
import 'package:tracking_trucks_parking/data/models/truck_model.dart';

class TruckCheckinCardWidget extends StatelessWidget {
  final TruckModel truck;
  const TruckCheckinCardWidget({
    Key key,
    this.truck,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 48,
            width: 48,
            color: AppColors.grey,
            child: Image.network(truck.photo, fit: BoxFit.cover),
          ),
        ),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              truck.model,
              style: AppTextStyles.paragraphBold
                  .copyWith(color: AppColors.magentaDark),
            ),
            SizedBox(height: 10),
            Text(
              truck.plate,
              style: AppTextStyles.description
                  .copyWith(color: AppColors.magentaLight),
            ),
          ],
        ),
      ],
    );
  }
}
