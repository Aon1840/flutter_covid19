import 'package:flutter_covid19/services/Network.dart';

import '../Constants.dart';

class ConstantDaily {
  Future<dynamic> callGetCovidConstantDaily() async {
    var url = "$baseCovidStatUrl/getTodayCases.json";
    Network network = Network(url);
    var covidResponse = await network.getData();
    return covidResponse;
  }
}
