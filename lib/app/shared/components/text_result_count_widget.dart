import 'package:flutter/material.dart';
import '../helpers/app_colors.dart';

class ResultCountList extends StatelessWidget {
  final int count;
  String get title => "${count <= 0 ? "" : count > 1 ? "$count resultados encontrados" : "$count resultado encontrado"}";

  ResultCountList({
    Key? key,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        title,
        style: AppTheme.defaultStyle.copyWith(fontWeight: FontWeight.normal),
      ),
    );
  }
}
