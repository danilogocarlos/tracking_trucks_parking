import 'package:flutter/material.dart';
import 'package:tracking_trucks_parking/core/core.dart';
import 'package:tracking_trucks_parking/core/widgets/back_to_list_button.dart';
import 'package:tracking_trucks_parking/core/widgets/view_more.dart';

class TimelineWidget extends StatefulWidget {
  final Widget content;
  final Widget bottomCard;
  const TimelineWidget({
    Key key,
    @required this.content,
    this.bottomCard,
  }) : super(key: key);

  @override
  _TimelineWidgetState createState() => _TimelineWidgetState();
}

class _TimelineWidgetState extends State<TimelineWidget> {
  bool _expandedContainer;

  @override
  void initState() {
    super.initState();
    _expandedContainer = false;
  }

  @override
  Widget build(BuildContext context) {
    double pageHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.magentaLight.withOpacity(0.5),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedContainer(
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: 400),
              height: _expandedContainer ? pageHeight : pageHeight / 1.5,
              padding: EdgeInsets.fromLTRB(24, 16, 24, 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_expandedContainer ? 0 : 30),
                  topRight: Radius.circular(_expandedContainer ? 0 : 30),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 24),
                  Expanded(
                    child: ListView(
                      physics: _expandedContainer
                          ? BouncingScrollPhysics()
                          : NeverScrollableScrollPhysics(),
                      children: [
                        widget.content ?? SizedBox.shrink(),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  ViewMoreWidget(
                    expandedContainer: _expandedContainer,
                    onPressed: () {
                      setState(() {
                        _expandedContainer = !_expandedContainer;
                      });
                    },
                  ),
                  SizedBox(height: 24),
                  widget.bottomCard ?? SizedBox.shrink(),
                  SizedBox(height: 24),
                  BackToListWidget(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
