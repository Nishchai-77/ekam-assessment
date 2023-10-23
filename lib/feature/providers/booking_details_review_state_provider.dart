import 'package:ekam_assesment/feature/domain/model/booking_confirmation_entity.dart';
import 'package:ekam_assesment/feature/domain/model/booking_details_review_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookingReviewStateProvider = StateNotifierProvider
<BookingsResNotifier,BookingDetailsReviewEntity>((ref) => BookingsResNotifier(ref));

class BookingsResNotifier extends StateNotifier<BookingDetailsReviewEntity>{

  BookingsResNotifier(this.ref):super(BookingDetailsReviewEntity(package: "",duration: ""));
  Ref ref;

  void updateDuration(String duration){
    final bookings = BookingDetailsReviewEntity(package: state.package,duration: duration);
    //print(state.package);
    //print(duration);
    state = bookings;
  }

  void updatePkg(String pkg){
    final bookings = BookingDetailsReviewEntity(package: pkg, duration: state.duration);
    state = bookings;
  }

}