import 'package:ekam_assesment/feature/providers/booking_confirmation_state_provider.dart';
import 'package:ekam_assesment/feature/screens/select_package_screen.dart';
import 'package:ekam_assesment/feature/screens/view_bookings_screen.dart';
import 'package:ekam_assesment/feature/viewmodels/booking_confirmation_viewmodel.dart';
import 'package:ekam_assesment/feature/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/common_button_widget.dart';

class BookingConfirmationScreen extends ConsumerStatefulWidget {
  const BookingConfirmationScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return BookingConfirmationScreenState();
  }
}

class BookingConfirmationScreenState
    extends ConsumerState<BookingConfirmationScreen> {
  late BookingConfirmationViewModel bookingConfirmationViewModel;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,()async{
      bookingConfirmationViewModel = ref.read(bookingConfirmationVmProvider);
      bookingConfirmationViewModel.getBookingConfirmation();
    });

  }

  @override
  Widget build(BuildContext context) {
    final bookingConfirmationState =
        ref.watch(bookingConfirmationStateProvider);

    final booking = bookingConfirmationState.bookingConfirmation;

    return Scaffold(
        body:Container(
        alignment: Alignment.center,
        child: bookingConfirmationState!.loading!
            ? const CircularProgressIndicator()
            : ListView(shrinkWrap: true, children: [
                const AppBarWidget(title: "Review Confirmation"),
                const SizedBox(
                  height: 60,
                ),
                const Icon(
                  Icons.check_circle_rounded,
                  color: Colors.blueAccent,
                  size: 120,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "You have successfully booked appointment with",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10,),
                Align(
                  alignment: Alignment.center,
                  child:
                Text(
                  "${booking.doctorName}",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),),
                const SizedBox(
                  height: 60,
                ),
                Container(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child:
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.person,
                        color: Colors.blueAccent,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "${booking.location}",
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ])),
                const SizedBox(height: 20,),
                Container(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      color: Colors.blueAccent,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      flex: 4,
                      child: Text(
                        "${booking.appointmentDate}",
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    const Flexible(
                      flex: 3,
                      child:
                    SizedBox(width: 60,),),
                    const Flexible(child:
                    Icon(
                      Icons.timer_rounded,
                      color: Colors.blueAccent,
                      size: 30,
                    ),),
                    const SizedBox(width: 10,),
                    Flexible(
                        flex: 4,
                        child:
                    Text(
                      booking.appointmentTime!.substring(0,8),
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    )
                    ),
                  ],
                )
                ),
          const SizedBox(
            height: 100,
          ),
          Container(
            padding: const EdgeInsets.only(top: 20),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.vertical(top: Radius.circular(16)),
                border: Border(
                  top: BorderSide(color: Colors.grey, width: 0.8),
                  left: BorderSide(color: Colors.grey, width: 0),
                  right: BorderSide(color: Colors.grey, width: 0),
                  bottom: BorderSide(color: Colors.grey, width: 0),
                )),
            child: CommonButton(
                buttonName: "Make Appointment", callback: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const ViewBookingScreen();
              }));
            }),
          ),
          SizedBox(height: 30,),
          const Text("Book Another",textAlign:TextAlign.center,style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 16),)

              ])));
  }
}
