import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:tracking_trucks_parking/app/park/park_details_page.dart';
import 'package:tracking_trucks_parking/core/core.dart';
import 'package:tracking_trucks_parking/data/models/park_model.dart';

class ParkCardWidget extends StatelessWidget {
  final ParkModel park;

  const ParkCardWidget({
    Key key,
    this.park,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        PageRouteBuilder(
          opaque: false,
          pageBuilder: (context, animation, secondaryAnimation) =>
              ParkDetailsPage(park: park),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      park.title,
                      style: AppTextStyles.paragraphBold
                          .copyWith(color: AppColors.magentaDark),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color:
                              park.available ? AppColors.green : AppColors.red,
                          size: 10,
                        ),
                        SizedBox(width: 5),
                        Text(
                          park.available ? "Vaga disponível" : "Vaga ocupada",
                          style: AppTextStyles.description.copyWith(
                            color: park.available
                                ? AppColors.green
                                : AppColors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    (!park.available)
                        ? Column(
                            children: [
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Container(
                                      height: 32,
                                      width: 32,
                                      color: AppColors.grey,
                                      child: Image.network(
                                        park.checkins[0].truck.photo,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        park.checkins[0].truck.model,
                                        style: AppTextStyles.description
                                            .copyWith(
                                                color: AppColors.magentaDark),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        park.checkins[0].truck.plate,
                                        style: AppTextStyles.description
                                            .copyWith(
                                                color: AppColors.magentaLight),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              Icon(
                                Feather.clock,
                                size: 24,
                                color: AppColors.magentaLight,
                              ),
                              SizedBox(width: 5),
                              Text(
                                park.lastCheck,
                                style: AppTextStyles.description
                                    .copyWith(color: AppColors.magentaLight),
                              )
                            ],
                          ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
