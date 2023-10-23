import 'package:ekam_assesment/feature/domain/model/view_bookings.dart';
import 'package:ekam_assesment/feature/domain/model/view_bookings_enity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final viewBookingsStateProvider = StateNotifierProvider<ViewBookingsResNotifier,ViewBookingsEntity>((ref) => ViewBookingsResNotifier(ref));

class ViewBookingsResNotifier extends StateNotifier<ViewBookingsEntity>{

  Ref ref;

  ViewBookingsResNotifier(this.ref):super(ViewBookingsEntity(loading: false, viewBookings: []));

  void updateViewBookings(List<ViewBookings> viewBookings){

    final bookings = ViewBookingsEntity(loading: state.loading, viewBookings: viewBookings);
    state = bookings;

  }

  void toggleLoading(bool loading){
    final bookings = ViewBookingsEntity(loading: loading, viewBookings: state.viewBookings);
    state = bookings;
  }

}