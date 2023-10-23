import 'dart:convert';

import 'package:ekam_assesment/api_service.dart';
import 'package:ekam_assesment/feature/domain/model/booking_confirmation.dart';
import 'package:ekam_assesment/feature/providers/booking_confirmation_state_provider.dart';
import 'package:ekam_assesment/feature/providers/booking_details_review_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookingConfirmationVmProvider = Provider.autoDispose((ref) => BookingConfirmationViewModel(ref));

class BookingConfirmationViewModel {

  BookingConfirmationViewModel(this.ref){
    bookingConfirmationResNotifier = ref.read(bookingConfirmationStateProvider.notifier);
    apiService = ref.read(apiServiceProvider);
  }

  Ref ref;
  late BookingConfirmationResNotifier bookingConfirmationResNotifier;
  late ApiService apiService;

  void getBookingConfirmation()async{
    bookingConfirmationResNotifier.toggleLoading(true);
    apiService.getBookingConfirmationDetails().then((value){
      bookingConfirmationResNotifier.toggleLoading(false);
      final booking = BookingConfirmation.fromJson(value);
      bookingConfirmationResNotifier.updateBookingConfirmation(booking);
    });
  }


}