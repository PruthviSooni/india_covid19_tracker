import 'dart:convert';

import 'package:covid19_stats/configs/configs.dart';
import 'package:covid19_stats/models/statesModel.dart';
import 'package:http/http.dart' as http;

abstract class StateRepo {
  Future<List<Statewise>> getStateData();
}

class StateRepositoryImpl extends StateRepo {
  @override
  Future<List<Statewise>> getStateData() async {
    http.Response response = await http.get(Configs.url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Statewise> stateData = ApiResult.fromJson(data).statewise;
      return stateData;
    } else {
      throw Exception(response.statusCode);
    }
  }
}
