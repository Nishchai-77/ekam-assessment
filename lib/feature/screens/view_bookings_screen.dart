import 'package:cached_network_image/cached_network_image.dart';
import 'package:ekam_assesment/feature/providers/view_bookings_state_provider.dart';
import 'package:ekam_assesment/feature/viewmodels/view_bookings_viewmodel.dart';
import 'package:ekam_assesment/feature/widgets/view_bookings_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewBookingScreen extends ConsumerStatefulWidget {
  const ViewBookingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return ViewBookingScreenState();
  }

}

class ViewBookingScreenState extends ConsumerState<ViewBookingScreen> {

  @override
  void initState(){
    super.initState();
    Future.delayed(Duration.zero,()async{
      final viewBookingsVm = ref.read(viewBookingsVmProvider);
      viewBookingsVm.getViewBookings();
    });


  }

  @override
  Widget build(BuildContext context) {

    final viewBookingsState = ref.watch(viewBookingsStateProvider);

    final bookingsList = viewBookingsState.viewBookings;

    return Scaffold(
        body:
        Container(
          alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: viewBookingsState!.loading!?CircularProgressIndicator():ListView.builder(
            itemCount: bookingsList.length,
            itemBuilder: (BuildContext context,int index){
          return Container(
              margin: const EdgeInsets.only(top: 10,bottom: 10),
              child: ViewBookingsWidget(bookingsList![index]!));
        })
    )
    );
  }

}