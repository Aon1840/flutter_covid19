import 'package:flutter/material.dart';

import '../Constants.dart';

class IconContent extends StatelessWidget {
  IconContent({this.todayAmount, this.totalAmount, this.sectionName});

  final String todayAmount;
  final String totalAmount;
  final String sectionName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          todayAmount,
          style: kLabelTextStyle.copyWith(fontSize: 50.0),
        ),
        Text(
          totalAmount,
          style: kLabelTextStyle,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          sectionName,
          style: kLabelTextStyle.copyWith(fontSize: 20.0),
        )
      ],
    );
  }
}
