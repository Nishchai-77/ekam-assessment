import 'package:ekam_assesment/feature/domain/model/booking_confirmation.dart';
import 'package:ekam_assesment/feature/domain/model/booking_confirmation_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookingConfirmationStateProvider = StateNotifierProvider<BookingConfirmationResNotifier,BookingConfirmationEntity>
  ((ref) => BookingConfirmationResNotifier(ref));

class BookingConfirmationResNotifier extends StateNotifier<BookingConfirmationEntity>{
  BookingConfirmationResNotifier(this.ref):
        super(BookingConfirmationEntity(loading: false, bookingConfirmation: BookingConfirmation()));

  Ref ref;

  void updateBookingConfirmation(BookingConfirmation bookingConfirmation){
    final booking = BookingConfirmationEntity(loading: state.loading, bookingConfirmation: bookingConfirmation);
    state = booking;
  }

  void toggleLoading(bool loading){
    final booking = BookingConfirmationEntity(loading: loading , bookingConfirmation: state.bookingConfirmation);
    state = booking;
  }


}