import 'dart:convert';

import 'package:ekam_assesment/api_service.dart';
import 'package:ekam_assesment/feature/domain/model/view_bookings.dart';
import 'package:ekam_assesment/feature/providers/view_bookings_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final viewBookingsVmProvider = Provider.autoDispose((ref) => ViewBookingsViewModel(ref));

class ViewBookingsViewModel{
  Ref ref;
  late ViewBookingsResNotifier viewBookingsResNotifier;
  late ApiService apiService;

  ViewBookingsViewModel(this.ref){
    viewBookingsResNotifier = ref.read(viewBookingsStateProvider.notifier);
    apiService = ref.read(apiServiceProvider);
  }

  void getViewBookings()async{
    viewBookingsResNotifier.toggleLoading(true);
    apiService.getBookings().then((value) {
      viewBookingsResNotifier.toggleLoading(false);
      final bookingsList = bookingsListFromJson(jsonEncode(value));
      viewBookingsResNotifier.updateViewBookings(bookingsList);
    });
  }

}