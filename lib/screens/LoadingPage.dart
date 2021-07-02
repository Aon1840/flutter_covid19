import 'package:flutter/material.dart';
import 'package:flutter_covid19/models/ConstantDaily.dart';
import 'package:flutter_covid19/screens/HomePage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  void initState() {
    super.initState();
    callService();
  }

  void callService() async {
    var covidConstant = await ConstantDaily().callGetCovidConstantDaily();
    var covidTimeline = await ConstantDaily().callGetCovidTimeline();

    print(covidConstant);
    print(covidTimeline);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomePage(
          covidConstant: covidConstant, covidTimeline: covidTimeline);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Color(0xFF0A0E21),
          size: 100.0,
        ),
      ),
    );
  }
}
