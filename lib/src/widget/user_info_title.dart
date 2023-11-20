import 'package:flutter/material.dart';
import 'package:delivery/src/utils/my_colors.dart';

class UserInfoTile extends StatelessWidget {
  final String label, value;
  final EdgeInsetsGeometry margin, padding;
  final Color valueBackground;
  UserInfoTile(
      {required this.label,
      required this.value,
      required this.padding,
      required this.margin,
      required this.valueBackground});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(label,
                style: const TextStyle(
                    color: MyColors.primaryColorDark, fontSize: 12)),
          ),
          Container(
            margin: const EdgeInsets.only(top: 6),
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(16),
            color: valueBackground ?? MyColors.primaryOpacityColor,
            child: Text(value,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'inter')),
          )
        ],
      ),
    );
  }
}
