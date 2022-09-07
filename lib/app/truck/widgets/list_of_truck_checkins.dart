import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import 'package:tracking_trucks_parking/core/core.dart';
import 'package:tracking_trucks_parking/data/models/truck_model.dart';

class ListOfTruckCheckinsWidget extends StatelessWidget {
  final bool expandedContainer;
  final TruckModel truck;
  const ListOfTruckCheckinsWidget({Key key, this.expandedContainer, this.truck})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FixedTimeline.tileBuilder(
      theme: TimelineThemeData(color: AppColors.blue),
      builder: TimelineTileBuilder.connectedFromStyle(
        contentsAlign: ContentsAlign.basic,
        oppositeContentsBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 25),
          child: Text(
            'Entrou na vaga ${truck.checkins[index].park} às ${truck.checkins[index]?.timeIn}' ??
                '',
            textAlign: TextAlign.end,
            style: AppTextStyles.description
                .copyWith(color: AppColors.magentaLight),
          ),
        ),
        contentsBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 25),
          child: Text(
            truck.checkins[index]?.timeOut != null
                ? 'Saiu da vaga ${truck.checkins[index].park} às \n${truck.checkins[index]?.timeOut}'
                : 'Continua na vaga\n',
            style: AppTextStyles.description
                .copyWith(color: AppColors.magentaDark),
          ),
        ),
        connectorStyleBuilder: (context, index) => ConnectorStyle.dashedLine,
        indicatorStyleBuilder: (context, index) => IndicatorStyle.dot,
        itemCount: truck.checkins.length,
      ),
    );
  }
}
