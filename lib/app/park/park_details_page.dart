import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:timelines/timelines.dart';
import 'package:tracking_trucks_parking/core/core.dart';
import 'package:tracking_trucks_parking/data/models/park_model.dart';

class ParkDetailsPage extends StatefulWidget {
  final ParkModel park;

  const ParkDetailsPage({Key key, this.park}) : super(key: key);

  @override
  _ParkDetailsPageState createState() => _ParkDetailsPageState();
}

class _ParkDetailsPageState extends State<ParkDetailsPage> {
  bool expandedContainer;

  @override
  void initState() {
    super.initState();
    expandedContainer = false;
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
              height: expandedContainer ? pageHeight : pageHeight / 1.5,
              padding: EdgeInsets.fromLTRB(24, 16, 24, 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(expandedContainer ? 0 : 30),
                  topRight: Radius.circular(expandedContainer ? 0 : 30),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.magentaLight,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  SizedBox(height: 24),
                  Expanded(
                    child: ListView(
                      physics: expandedContainer
                          ? BouncingScrollPhysics()
                          : NeverScrollableScrollPhysics(),
                      children: [
                        FixedTimeline.tileBuilder(
                          theme: TimelineThemeData(color: AppColors.blue),
                          builder: TimelineTileBuilder.connectedFromStyle(
                            contentsAlign: ContentsAlign.basic,
                            oppositeContentsBuilder: (context, index) =>
                                Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 25),
                              child: Text(
                                '${widget.park.checkins[index].truck.driver.name} entrou na vaga às ${widget.park.checkins[index]?.timeIn}' ??
                                    '',
                                textAlign: TextAlign.end,
                                style: AppTextStyles.description
                                    .copyWith(color: AppColors.magentaLight),
                              ),
                            ),
                            contentsBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 25),
                              child: Text(
                                widget.park.checkins[index]?.timeOut != null
                                    ? '${widget.park.checkins[index].truck.driver.name} saiu às \n${widget.park.checkins[index]?.timeOut}'
                                    : '${widget.park.checkins[index].truck.driver.name} continua na vaga',
                                style: AppTextStyles.description
                                    .copyWith(color: AppColors.magentaDark),
                              ),
                            ),
                            connectorStyleBuilder: (context, index) =>
                                ConnectorStyle.dashedLine,
                            indicatorStyleBuilder: (context, index) =>
                                IndicatorStyle.dot,
                            itemCount: widget.park.checkins.length,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    widget.park.title,
                    style: AppTextStyles.description.copyWith(
                      color: AppColors.magentaDark,
                    ),
                  ),
                  SizedBox(height: 24),
                  TextButton(
                    style: _clearButtonStyle(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          expandedContainer
                              ? Feather.chevron_down
                              : Feather.chevron_up,
                          size: 26,
                          color: AppColors.blue,
                        ),
                        SizedBox(width: 5),
                        Text(
                          expandedContainer ? "Mostrar menos" : "Mostrar mais",
                          style: AppTextStyles.textButton
                              .copyWith(color: AppColors.blue),
                        )
                      ],
                    ),
                    onPressed: () => setState(() {
                      expandedContainer = !expandedContainer;
                    }),
                  ),
                  SizedBox(height: 24),
                  Container(
                    width: double.maxFinite,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: AppColors.blue,
                    ),
                    child: TextButton(
                      style: _clearButtonStyle(),
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "Voltar para a lista",
                        style: AppTextStyles.paragraphBold.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  ButtonStyle _clearButtonStyle() {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
      overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
      shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
    );
  }
}
