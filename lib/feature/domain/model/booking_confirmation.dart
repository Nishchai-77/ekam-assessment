
class BookingConfirmation {
  String? doctorName;
  String? appointmentDate;
  String? appointmentTime;
  String? location;
  String? appointmentPackage;

  BookingConfirmation(
      {this.doctorName,
        this.appointmentDate,
        this.appointmentTime,
        this.location,
        this.appointmentPackage});

  BookingConfirmation.fromJson(Map<String, dynamic> json) {
    doctorName = json['doctor_name'];
    appointmentDate = json['appointment_date'];
    appointmentTime = json['appointment_time'];
    location = json['location'];
    appointmentPackage = json['appointment_package'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doctor_name'] = this.doctorName;
    data['appointment_date'] = this.appointmentDate;
    data['appointment_time'] = this.appointmentTime;
    data['location'] = this.location;
    data['appointment_package'] = this.appointmentPackage;
    return data;
  }
}
