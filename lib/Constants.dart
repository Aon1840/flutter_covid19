import 'package:flutter/material.dart';

const baseCovidStatUrl = "https://covid19.th-stat.com/json/covid19v2";

const kLabelTextStyle = TextStyle(
  fontSize: 18.0,
  fontFamily: "Khanit",
  color: Color(0xFF8D8E98),
);

const List<Color> gradientColors = [
  const Color(0xffDA44bb),
  const Color(0xff8921aa),
];

final Shader linearGradient = LinearGradient(
  colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

final Shader newRecoveredGradient = LinearGradient(
  colors: <Color>[Color(0xffADD100), Color(0xff7B920A)],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

final Shader newConfirmGradient = LinearGradient(
  colors: <Color>[Color(0xff360033), Color(0xff0b8793)],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

final Shader newDeathGradient = LinearGradient(
  colors: <Color>[Color(0xfffe8c00), Color(0xfff83600)],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

final Shader backgroundGradient = LinearGradient(
  colors: <Color>[Color(0xff780206), Color(0xff061161)],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
