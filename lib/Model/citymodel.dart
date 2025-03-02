class CityModel {
  String? status;
  String? error;
  List<CityData>? result;

  CityModel({this.status, this.error, this.result});

  CityModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    if (json['result'] != null) {
      result = <CityData>[];
      json['result'].forEach((v) {
        result!.add(new CityData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['error'] = this.error;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CityData {
  String? cityId;
  String? cityName;
  String? cityIsActive;

  CityData({this.cityId, this.cityName, this.cityIsActive});

  CityData.fromJson(Map<String, dynamic> json) {
    cityId = json['city_id'];
    cityName = json['city_name'];
    cityIsActive = json['city_is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city_id'] = this.cityId;
    data['city_name'] = this.cityName;
    data['city_is_active'] = this.cityIsActive;
    return data;
  }
}