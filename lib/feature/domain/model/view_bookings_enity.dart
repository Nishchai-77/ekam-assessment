import 'package:ekam_assesment/feature/domain/model/view_bookings.dart';

class ViewBookingsEntity {

  ViewBookingsEntity({required this.loading,required this.viewBookings});

  bool? loading;
  List<ViewBookings> viewBookings;
}