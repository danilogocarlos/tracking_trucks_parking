import 'package:flutter/material.dart';
import 'package:tracking_trucks_parking/app/truck/widgets/list_of_truck_checkins.dart';
import 'package:tracking_trucks_parking/app/truck/widgets/truck_checkin_card.dart';
import 'package:tracking_trucks_parking/core/widgets/timeline_widget.dart';
import 'package:tracking_trucks_parking/data/models/truck_model.dart';

class TruckDetailsPage extends StatelessWidget {
  final TruckModel truck;
  const TruckDetailsPage({Key key, this.truck}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TimelineWidget(
      content: ListOfTruckCheckinsWidget(truck: truck),
      bottomCard: TruckCheckinCardWidget(truck: truck),
    );
  }
}
