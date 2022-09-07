import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:tracking_trucks_parking/core/core.dart';

class ViewMoreWidget extends StatelessWidget {
  final bool expandedContainer;
  final Function onPressed;

  ViewMoreWidget({
    Key key,
    @required this.expandedContainer,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            expandedContainer ? Feather.chevron_down : Feather.chevron_up,
            size: 26,
            color: AppColors.blue,
          ),
          SizedBox(width: 5),
          Text(
            expandedContainer ? "Mostrar menos" : "Mostrar mais",
            style: AppTextStyles.textButton.copyWith(color: AppColors.blue),
          )
        ],
      ),
      onPressed: onPressed,
    );
  }
}
