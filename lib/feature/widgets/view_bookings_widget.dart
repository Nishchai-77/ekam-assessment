import 'package:cached_network_image/cached_network_image.dart';
import 'package:ekam_assesment/feature/domain/model/view_bookings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'common_button_two.dart';

class ViewBookingsWidget extends ConsumerWidget {
  const ViewBookingsWidget(this.viewBookings, {super.key});

  final ViewBookings viewBookings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Card(
        elevation:10,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      child: Container(
        padding: const EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Sep ${viewBookings.appointmentDate!.substring(5,7)},2023 - ${viewBookings.appointmentTime!.substring(0,8)}",style: const TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            const Divider(height: 1,color: Colors.black12,),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child:
                SizedBox(
                  width: 120,
                    height: 120,
                    child:ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                child:
                Image.network('https://hireforekam.s3.ap-south-1.amazonaws.com/doctors/1-Doctor.png')),)),//hard coded image is not cmng fromserver side
                //const SizedBox(width: 20,),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(viewBookings.doctorName!,textAlign:TextAlign.start,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        const Icon(Icons.location_on,size: 20,color: Colors.blueAccent,),
                        Text(viewBookings.location!,style: const TextStyle(color: Colors.black38,fontSize: 16,fontWeight: FontWeight.bold),)
                      ],
                    ),
                    const SizedBox(height: 10,),
                     Row(
                      children: [
                        const Icon(Icons.add_box_sharp,size: 20,color: Colors.blueAccent,),
                        const Text(" Booking ID : ",style: TextStyle(color: Colors.black38,fontSize: 16,fontWeight: FontWeight.bold),),
                        Text("#${viewBookings.bookingId!}",style: const TextStyle(color: Colors.blueAccent,fontSize: 16,fontWeight: FontWeight.bold))
                      ],
                    ),
                    
                  ],
                )
              ],
            ),
            const SizedBox(height: 20,),
            const Divider(height: 2,color: Colors.black12,),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child:
                CommonButtonTwo(buttonName: 'Cancel', callback: () {  }, buttonType: 2,),),
                Flexible(child:
                CommonButtonTwo(buttonName: 'Reschedule', callback: () {  }, buttonType: 1,))
              ],
            )
          ],
        )
      ),
    );



  }
}
