import 'package:flutter/material.dart';

const baseCovidStatUrl = "https://covid19.th-stat.com/json/covid19v2";

const kLabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

const List<Color> gradientColors = [
  const Color(0xffDA44bb),
  const Color(0xff8921aa),
];

final Shader linearGradient = LinearGradient(
  colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
