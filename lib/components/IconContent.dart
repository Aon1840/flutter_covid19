import 'package:flutter/material.dart';

import '../Constants.dart';

class IconContent extends StatelessWidget {
  IconContent(
      {this.todayAmount,
      this.totalAmount,
      this.sectionName,
      this.colorSection});

  final String todayAmount;
  final String totalAmount;
  final String sectionName;
  final colorSection;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          todayAmount,
          style: kLabelTextStyle.copyWith(fontSize: 50.0, color: Colors.white),
        ),
        Text(
          totalAmount,
          style: kLabelTextStyle.copyWith(foreground: colorSection),
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          sectionName,
          style: kLabelTextStyle.copyWith(
            fontSize: 20.0,
          ),
        )
      ],
    );
  }
}
