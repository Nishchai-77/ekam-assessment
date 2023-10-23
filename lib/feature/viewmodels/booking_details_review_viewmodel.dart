import 'package:ekam_assesment/feature/domain/model/booking_details_review_entity.dart';
import 'package:ekam_assesment/feature/providers/booking_details_review_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookingsVmProvider = Provider.autoDispose((ref) => BookingDetailsReViewModel(ref));

class BookingDetailsReViewModel{

  BookingDetailsReViewModel(this.ref){
    bookingsResNotifier = ref.read(bookingReviewStateProvider.notifier);
  }

  Ref ref;
  late BookingsResNotifier bookingsResNotifier;

  void updateBookingsDuration(String duration){
   bookingsResNotifier.updateDuration(duration);
  }

  void updateBookingsPkg(String pkg){
    bookingsResNotifier.updatePkg(pkg);
  }



}