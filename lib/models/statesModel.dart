class ApiResult {
  List<Statewise> statewise;

  ApiResult({this.statewise});

  ApiResult.fromJson(Map<String, dynamic> json) {
    if (json['statewise'] != null) {
      statewise = new List<Statewise>();
//  store the fetch data from api to statewise list
      json['statewise'].forEach((v) {
        statewise.add(new Statewise.fromJson(v));
      });
    }
  }
}

//model to make easy to access the data from the api using this model
class Statewise {
  String active;
  String confirmed;
  String deaths;
  String deltaconfirmed;
  String deltadeaths;
  String deltarecovered;
  String lastupdatedtime;
  String migratedother;
  String recovered;
  String state;
  String statecode;
  String statenotes;
// instantiate the dataTypes to the model constructor
  Statewise(
      {this.active,
      this.confirmed,
      this.deaths,
      this.deltaconfirmed,
      this.deltadeaths,
      this.deltarecovered,
      this.lastupdatedtime,
      this.migratedother,
      this.recovered,
      this.state,
      this.statecode,
      this.statenotes});
//  assign values to the data coming from the api
  Statewise.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    confirmed = json['confirmed'];
    deaths = json['deaths'];
    deltaconfirmed = json['deltaconfirmed'];
    deltadeaths = json['deltadeaths'];
    deltarecovered = json['deltarecovered'];
    lastupdatedtime = json['lastupdatedtime'];
    migratedother = json['migratedother'];
    recovered = json['recovered'];
    state = json['state'];
    statecode = json['statecode'];
    statenotes = json['statenotes'];
  }
}
