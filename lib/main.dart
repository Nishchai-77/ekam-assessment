import 'package:ekam_assesment/feature/screens/booking_confirmation_screen.dart';
import 'package:ekam_assesment/feature/screens/booking_review_screen.dart';
import 'package:ekam_assesment/feature/screens/doctor_details_screen.dart';
import 'package:ekam_assesment/feature/screens/select_package_screen.dart';
import 'package:ekam_assesment/feature/screens/view_bookings_screen.dart';
import 'package:ekam_assesment/feature/widgets/date_list_widget.dart';

import 'package:ekam_assesment/feature/widgets/duration_drop_down_widget.dart';
import 'package:ekam_assesment/feature/widgets/package_type_radio_btn_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'feature/widgets/view_bookings_widget.dart';

void main(){
  runApp(const ProviderScope(child:MaterialApp(home:DoctorDetailsScreen(),)));

}