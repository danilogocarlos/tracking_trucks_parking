import 'package:flutter/material.dart';

import 'package:tracking_trucks_parking/app/truck/truck_details_page.dart';
import 'package:tracking_trucks_parking/core/core.dart';
import 'package:tracking_trucks_parking/data/models/truck_model.dart';

class TruckCardWidget extends StatelessWidget {
  final TruckModel truck;

  const TruckCardWidget({Key key, this.truck}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        PageRouteBuilder(
          opaque: false,
          pageBuilder: (context, animation, secondaryAnimation) =>
              TruckDetailsPage(truck: truck),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.all(16),
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  child: Container(
                    height: 100,
                    width: 100,
                    color: AppColors.grey,
                    child: Image.network(
                      truck.photo,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              flex: 2,
              child: Container(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
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
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            child: Container(
                              height: 24,
                              width: 24,
                              color: AppColors.blue,
                              child: Image.network(
                                truck.driver.photo,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          truck.driver.name,
                          style: AppTextStyles.description
                              .copyWith(color: AppColors.magentaLight),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
