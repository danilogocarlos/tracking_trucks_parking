import 'package:flutter/material.dart';
import 'package:tracking_trucks_parking/app/home/widgets/park_list/park_card_widget.dart';
import 'package:tracking_trucks_parking/data/models/park_model.dart';

class ParkListWidget extends StatefulWidget {
  final List<ParkModel> parks;

  const ParkListWidget({Key key, this.parks}) : super(key: key);

  @override
  _ParkListWidgetState createState() => _ParkListWidgetState();
}

class _ParkListWidgetState extends State<ParkListWidget> {
  final _listItems = <Widget>[];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  void _loadItems() {
    List<Widget> list =
        widget.parks.map((e) => ParkCardWidget(park: e)).toList();

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
