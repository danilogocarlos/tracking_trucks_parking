import 'package:flutter/material.dart';
import 'package:tracking_trucks_parking/app/home/widgets/filters/filter_button.dart';
import 'package:tracking_trucks_parking/core/core.dart';

class FiltersListWidget extends StatelessWidget {
  final int selectedOption;
  final Function onTap;

  const FiltersListWidget({
    Key key,
    this.selectedOption,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.filter_list, color: AppColors.magentaLight),
        SizedBox(width: 15),
        _buildButton('Todos', () => onTap(0), selectedOption == 0),
        SizedBox(width: 15),
        _buildButton('Disponíveis', () => onTap(1), selectedOption == 1),
        SizedBox(width: 15),
        _buildButton('Ocupados', () => onTap(2), selectedOption == 2),
      ],
    );
  }

  Widget _buildButton(String label, Function onTap, bool isSelected) {
    return isSelected
        ? FilterButton.blue(label: label, onTap: onTap)
        : FilterButton.magenta(label: label, onTap: onTap);
  }
}
