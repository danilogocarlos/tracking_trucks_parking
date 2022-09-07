import 'package:flutter/material.dart';
import 'package:tracking_trucks_parking/app/park/widgets/list_of_park_checkins.dart';
import 'package:tracking_trucks_parking/core/widgets/timeline_widget.dart';
import 'package:tracking_trucks_parking/data/models/park_model.dart';

class ParkDetailsPage extends StatelessWidget {
  final ParkModel park;
  const ParkDetailsPage({Key key, this.park}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TimelineWidget(
      content: ListOfParkCheckinsWidget(park: park),
    );
  }
}
