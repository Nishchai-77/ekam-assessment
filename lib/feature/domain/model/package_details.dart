

import 'dart:convert';

//List<PackageDetails> packageDetailsFromJson(String str) => List<PackageDetails>.from(json.decode(str).map((x) => PackageDetails.fromJson(x)));

class PackageDetails {
  List<String>? duration;
  List<String>? package;

  PackageDetails({this.duration, this.package});

  PackageDetails.fromJson(Map<String, dynamic> json) {
    duration = json['duration'].cast<String>();
    package = json['package'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['duration'] = this.duration;
    data['package'] = this.package;
    return data;
  }
}
