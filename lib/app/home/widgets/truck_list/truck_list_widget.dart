import 'package:flutter/material.dart';
import 'package:tracking_trucks_parking/app/home/widgets/truck_list/truck_card_widget.dart';
import 'package:tracking_trucks_parking/data/models/truck_model.dart';

class TrucksListWidget extends StatefulWidget {
  final List<TruckModel> trucks;

  const TrucksListWidget({Key key, this.trucks}) : super(key: key);

  @override
  _TrucksListWidgetState createState() => _TrucksListWidgetState();
}

class _TrucksListWidgetState extends State<TrucksListWidget> {
  final _listItems = <Widget>[];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  void _loadItems() {
    List<Widget> list =
        widget.trucks.map((e) => TruckCardWidget(truck: e)).toList();
    var future = Future(() {});
    for (var i = 0; i < list.length; i++) {
      future = future.then((_) {
        return Future.delayed(Duration(milliseconds: 50), () {
          _listItems.add(list[i]);
          _listKey.currentState?.insertItem(_listItems.length - 1);
        });
      });
    }
  }

  void _clearItems() {
    for (var i = 0; i <= _listItems.length - 1; i++) {
      _listKey.currentState.removeItem(0,
          (BuildContext context, Animation<double> animation) {
        return Container();
      });
    }
    _listItems.clear();
  }

  @override
  Widget build(BuildContext context) {
    _clearItems();
    _loadItems();
    return AnimatedList(
      physics: BouncingScrollPhysics(),
      key: _listKey,
      padding: EdgeInsets.only(top: 10, bottom: 100),
      initialItemCount: _listItems.length,
      itemBuilder: (context, index, animation) {
        return SlideTransition(
          position: CurvedAnimation(
            curve: Curves.easeOut,
            parent: animation,
          ).drive(Tween<Offset>(
            begin: Offset(.1, 0),
            end: Offset(0, 0),
          )),
          child: _listItems[index],
        );
      },
    );
  }
}
