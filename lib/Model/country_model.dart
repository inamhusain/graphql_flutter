/// data : {"countries":[{"name":"United States","isoCode":"us"},{"name":"Germany","isoCode":"de"},{"name":"United Kingdom","isoCode":"gb"},{"name":"Canada","isoCode":"ca"},{"name":"India","isoCode":"in"},{"name":"Norway","isoCode":"no"},{"name":"France","isoCode":"fr"},{"name":"Denmark","isoCode":"dk"},{"name":"Poland","isoCode":"pl"},{"name":"Mexico","isoCode":"mx"},{"name":"Taiwan","isoCode":"tw"},{"name":"Portugal","isoCode":"pt"}]}

class CountryModel {
  CountryModel({
      this.data,});

  CountryModel.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// countries : [{"name":"United States","isoCode":"us"},{"name":"Germany","isoCode":"de"},{"name":"United Kingdom","isoCode":"gb"},{"name":"Canada","isoCode":"ca"},{"name":"India","isoCode":"in"},{"name":"Norway","isoCode":"no"},{"name":"France","isoCode":"fr"},{"name":"Denmark","isoCode":"dk"},{"name":"Poland","isoCode":"pl"},{"name":"Mexico","isoCode":"mx"},{"name":"Taiwan","isoCode":"tw"},{"name":"Portugal","isoCode":"pt"}]

class Data {
  Data({
      this.countries,});

  Data.fromJson(dynamic json) {
    if (json['countries'] != null) {
      countries = [];
      json['countries'].forEach((v) {
        countries?.add(Countries.fromJson(v));
      });
    }
  }
  List<Countries>? countries;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (countries != null) {
      map['countries'] = countries?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// name : "United States"
/// isoCode : "us"

class Countries {
  Countries({
      this.name, 
      this.isoCode,});

  Countries.fromJson(dynamic json) {
    name = json['name'];
    isoCode = json['isoCode'];
  }
  String? name;
  String? isoCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['isoCode'] = isoCode;
    return map;
  }

}