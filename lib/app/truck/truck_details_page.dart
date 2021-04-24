import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:timelines/timelines.dart';
import 'package:tracking_trucks_parking/core/core.dart';
import 'package:tracking_trucks_parking/data/models/truck_model.dart';

class TruckDetailsPage extends StatefulWidget {
  final TruckModel truck;

  const TruckDetailsPage({Key key, this.truck}) : super(key: key);

  @override
  _TruckDetailsPageState createState() => _TruckDetailsPageState();
}

class _TruckDetailsPageState extends State<TruckDetailsPage> {
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
                        FixedTimeline.tileBuilder(
                          theme: TimelineThemeData(color: AppColors.blue),
                          builder: TimelineTileBuilder.connectedFromStyle(
                            contentsAlign: ContentsAlign.basic,
                            oppositeContentsBuilder: (context, index) =>
                                Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 25),
                              child: Text(
                                'Entrou na vaga ${widget.truck.checkins[index].park} às ${widget.truck.checkins[index]?.timeIn}' ??
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
                                widget.truck.checkins[index]?.timeOut != null
                                    ? 'Saiu da vaga ${widget.truck.checkins[index].park} às \n${widget.truck.checkins[index]?.timeOut}'
                                    : 'Continua na vaga\n',
                                style: AppTextStyles.description
                                    .copyWith(color: AppColors.magentaDark),
                              ),
                            ),
                            connectorStyleBuilder: (context, index) =>
                                ConnectorStyle.dashedLine,
                            indicatorStyleBuilder: (context, index) =>
                                IndicatorStyle.dot,
                            itemCount: widget.truck.checkins.length,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  TextButton(
                    style: _clearButtonStyle(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          _expandedContainer
                              ? Feather.chevron_down
                              : Feather.chevron_up,
                          size: 26,
                          color: AppColors.blue,
                        ),
                        SizedBox(width: 5),
                        Text(
                          _expandedContainer ? "Mostrar menos" : "Mostrar mais",
                          style: AppTextStyles.textButton
                              .copyWith(color: AppColors.blue),
                        )
                      ],
                    ),
                    onPressed: () => setState(() {
                      _expandedContainer = !_expandedContainer;
                    }),
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 48,
                          width: 48,
                          color: AppColors.grey,
                          child: Image.network(
                            widget.truck.photo,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.truck.model,
                            style: AppTextStyles.paragraphBold
                                .copyWith(color: AppColors.magentaDark),
                          ),
                          SizedBox(height: 10),
                          Text(
                            widget.truck.plate,
                            style: AppTextStyles.description
                                .copyWith(color: AppColors.magentaLight),
                          ),
                        ],
                      ),
                    ],
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
