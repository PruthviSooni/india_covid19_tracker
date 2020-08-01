import 'dart:convert';

import 'package:covid19_stats/configs/configs.dart';
import 'package:covid19_stats/models/statesModel.dart';
import 'package:http/http.dart' as http;

//create getter method to get the data from the api
abstract class StateRepo {
  Future<List<Statewise>> getStateData();
}

class StateRepositoryImpl extends StateRepo {
  @override
  Future<List<Statewise>> getStateData() async {
//    make GET_HTTP request to the api
    http.Response response = await http.get(Configs.url);
//    check weather the data is available or not
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
//      store the response get from the api to API_RESULT class to list of Statewise
      List<Statewise> stateData = ApiResult.fromJson(data).statewise;
      return stateData;
    } else {
      throw Exception(response.statusCode);
    }
  }
}
