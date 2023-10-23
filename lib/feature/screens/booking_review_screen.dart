import 'package:ekam_assesment/feature/providers/booking_details_review_state_provider.dart';
import 'package:ekam_assesment/feature/screens/booking_confirmation_screen.dart';
import 'package:ekam_assesment/feature/screens/select_package_screen.dart';
import 'package:ekam_assesment/feature/widgets/app_bar_widget.dart';
import 'package:ekam_assesment/feature/widgets/doctor_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/common_button_widget.dart';

class BookingReviewScreen extends ConsumerWidget{
  const BookingReviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final bookingsState = ref.watch(bookingReviewStateProvider);

    Widget commonRow(String heading,String desc){
      return Container(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Flexible(child:
          Text(heading,style: const TextStyle(
            color: Colors.black38,
            fontWeight:FontWeight.w500,
            fontSize: 16
          ),),),
          Flexible(
              flex: 2,
              child:
          Text(desc,style: const TextStyle(color:Colors.black,fontSize: 16,fontWeight: FontWeight.w500),)),
        ],
      )
      );
    }


    return Scaffold(
        body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          children: [
            const AppBarWidget(title: "Review Summary"),
            const DoctorsProfileWidget(),
            const SizedBox(height: 20,),
            const Divider(height: 2,thickness: 0,color: Colors.grey,),
            const SizedBox(height: 20,),
            commonRow("Date & hour","${bookingsState.date} | ${bookingsState.time}"),
            const SizedBox(height: 20,),
            commonRow("Package", bookingsState!.package!),
            const SizedBox(height: 20,),
            commonRow("Duration",bookingsState!.duration!),
            const SizedBox(height: 20,),
            commonRow("Booking for", "self"),
            SizedBox(height: 200,),
            Container(
              alignment: Alignment.bottomCenter,
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
                  buttonName: "Confirm", callback: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return const BookingConfirmationScreen();
                }));
              }),
            ),
            const SizedBox(
              height: 40,
            )
            
            
          ],
        ),
      ),
    );


  }

}