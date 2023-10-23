
import 'dart:convert';

List<ViewBookings> bookingsListFromJson(String str) => List<ViewBookings>.from(json.decode(str).map((x) => ViewBookings.fromJson(x)));

class ViewBookings {
  String? bookingId;
  String? doctorName;
  String? location;
  String? appointmentDate;
  String? appointmentTime;

  ViewBookings(
      {this.bookingId,
        this.doctorName,
        this.location,
        this.appointmentDate,
        this.appointmentTime});

  ViewBookings.fromJson(Map<String, dynamic> json) {
    bookingId = json['booking_id'];
    doctorName = json['doctor_name'];
    location = json['location'];
    appointmentDate = json['appointment_date'];
    appointmentTime = json['appointment_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['booking_id'] = this.bookingId;
    data['doctor_name'] = this.doctorName;
    data['location'] = this.location;
    data['appointment_date'] = this.appointmentDate;
    data['appointment_time'] = this.appointmentTime;
    return data;
  }
}
