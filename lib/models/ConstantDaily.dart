import 'package:flutter_covid19/services/Network.dart';

import '../Constants.dart';

class ConstantDaily {
  Future<dynamic> callGetCovidConstantDaily() async {
    var url = "$baseCovidStatUrl/getTodayCases.json";
    Network network = Network(url);
    var covidResponse = await network.getData();
    return covidResponse;
  }

  Future<dynamic> callGetCovidTimeline() async {
    var url = "$baseCovidStatUrl/getTimeline.json";
    Network network = Network(url);
    var covidTimeline = await network.getData();
    return covidTimeline;
  }
}
