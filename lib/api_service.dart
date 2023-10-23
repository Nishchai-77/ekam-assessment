import 'dart:async';
import 'dart:convert';
import 'package:ekam_assesment/feature/domain/model/doctors_details.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;


final apiServiceProvider = Provider.autoDispose((ref) => ApiService(ref));

class ApiService{

  ApiService(this.ref);

  Ref ref;

    Future<dynamic> getDoctorsDetails()async{
    var response = await http.get(Uri.parse("https://my-json-server.typicode.com/githubforekam/doctor-appointment/doctors"));
    //print(response.body);
    var data = jsonDecode(response.body);
    return data;
  }
  
  Future<dynamic> getPackageDetails()async{
      var response = await http.get(Uri.parse("https://my-json-server.typicode.com/githubforekam/doctor-appointment/appointment_options"));
      var data = jsonDecode(response.body);
      print(response.body);
      return data;
  }
  
  Future<dynamic> getBookingConfirmationDetails()async{
      var response = await http.get(Uri.parse("https://my-json-server.typicode.com/githubforekam/doctor-appointment/booking_confirmation"));
      var data = jsonDecode(response.body);
      print(response.body);
      return data;
  }

  Future<dynamic> getBookings()async{
      var response = await http.get(Uri.parse("https://my-json-server.typicode.com/githubforekam/doctor-appointment/appointments"));
      var data = jsonDecode(response.body);
      print(response.body);
      return data;
  }
  


}