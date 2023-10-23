import 'dart:convert';

List<DoctorsDetails> doctorDetailsFromJson(String str) => List<DoctorsDetails>.from(json.decode(str).map((x) => DoctorsDetails.fromJson(x)));

String doctorsDetailToJsonToJson(List<DoctorsDetails> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DoctorsDetails {
  String? doctorName;
  String? image;
  String? speciality;
  String? location;
  int? patientsServed;
  int? yearsOfExperience;
  double? rating;
  int? numberOfReviews;
  Availability? availability;

  DoctorsDetails(
      {this.doctorName,
        this.image,
        this.speciality,
        this.location,
        this.patientsServed,
        this.yearsOfExperience,
        this.rating,
        this.numberOfReviews,
        this.availability});

  DoctorsDetails.fromJson(Map<String, dynamic> json) {
    doctorName = json['doctor_name'];
    image = json['image'];
    speciality = json['speciality'];
    location = json['location'];
    patientsServed = json['patients_served'];
    yearsOfExperience = json['years_of_experience'];
    rating = json['rating'];
    numberOfReviews = json['number_of_reviews'];
    availability = json['availability'] != null
        ? new Availability.fromJson(json['availability'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doctor_name'] = this.doctorName;
    data['image'] = this.image;
    data['speciality'] = this.speciality;
    data['location'] = this.location;
    data['patients_served'] = this.patientsServed;
    data['years_of_experience'] = this.yearsOfExperience;
    data['rating'] = this.rating;
    data['number_of_reviews'] = this.numberOfReviews;
    if (this.availability != null) {
      data['availability'] = this.availability!.toJson();
    }
    return data;
  }
}

class Availability {
  List<String>? s1;
  List<String>? s2;
  List<String>? s3;
  List<String>? s4;

  Availability(
      {this.s1, this.s2, this.s3, this.s4});

  Availability.fromJson(Map<String, dynamic> json) {
    s1 = json['2023-09-18'].cast<String>();
    s2 = json['2023-09-18'].cast<String>();
    s3 = json['2023-09-20'].cast<String>();
    s4 = json['2023-09-21'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['2023-09-18'] = this.s1;
    data['2023-09-18'] = this.s2;
    data['2023-09-20'] = this.s3;
    data['2023-09-21'] = this.s4;
    return data;
  }
}
