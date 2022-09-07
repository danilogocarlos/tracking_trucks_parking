import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import 'package:tracking_trucks_parking/core/core.dart';
import 'package:tracking_trucks_parking/data/models/park_model.dart';

class ListOfParkCheckinsWidget extends StatelessWidget {
  final bool expandedContainer;
  final ParkModel park;
  const ListOfParkCheckinsWidget({
    Key key,
    this.expandedContainer,
    this.park,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FixedTimeline.tileBuilder(
      theme: TimelineThemeData(color: AppColors.blue),
      builder: TimelineTileBuilder.connectedFromStyle(
        contentsAlign: ContentsAlign.basic,
        oppositeContentsBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 25),
          child: Text(
            '${park.checkins[index].truck.driver.name} entrou na vaga às ${park.checkins[index]?.timeIn}' ??
                '',
            textAlign: TextAlign.end,
            style: AppTextStyles.description
                .copyWith(color: AppColors.magentaLight),
          ),
        ),
        contentsBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 25),
          child: Text(
            park.checkins[index]?.timeOut != null
                ? '${park.checkins[index].truck.driver.name} saiu às \n${park.checkins[index]?.timeOut}'
                : '${park.checkins[index].truck.driver.name} continua na vaga',
            style: AppTextStyles.description
                .copyWith(color: AppColors.magentaDark),
          ),
        ),
        connectorStyleBuilder: (context, index) => ConnectorStyle.dashedLine,
        indicatorStyleBuilder: (context, index) => IndicatorStyle.dot,
        itemCount: park.checkins.length,
      ),
    );
  }
}
