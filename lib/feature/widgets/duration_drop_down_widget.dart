import 'package:ekam_assesment/feature/providers/package_details_state_provider.dart';
import 'package:ekam_assesment/feature/viewmodels/booking_details_review_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DurationDropDownWidget extends ConsumerStatefulWidget{
  const DurationDropDownWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return DropDownWidgetState();
  }

}

class DropDownWidgetState extends ConsumerState{

  //List<String> items = ["Items 1","Items 2","Items 3","Items 4","Items 5"];

  String? selectedVal = "30 min";

  late BookingDetailsReViewModel bookingDetailsReViewModel;

  @override
  void initState(){
    super.initState();
    Future.delayed(Duration.zero,()async{
      bookingDetailsReViewModel = ref.read(bookingsVmProvider);
    });

  }

  @override
  Widget build(BuildContext context) {

    final packageDetailsState = ref.watch(packageDetailsStateProvider);

    final durations = packageDetailsState.packageDetails!.duration;

    return Center(child:Container(
      //margin: const EdgeInsets.only(top: 100,left: 20,right: 20),
      padding: const EdgeInsets.only(left: 10,right: 0),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton(
        underline: const Divider(color: Colors.white,height: 0,thickness: 0,),
        icon: const Icon(Icons.keyboard_arrow_down_outlined),
        iconSize: 35,
        iconEnabledColor: Colors.blueAccent,
        iconDisabledColor: Colors.blueAccent,
        value: selectedVal,
        onChanged: (newVal){
          bookingDetailsReViewModel.updateBookingsDuration(newVal!);
          setState(() {
            print(newVal);
            selectedVal = newVal!;
            //bookingDetailsReViewModel.updateBookingsDuration(newVal!);
          });
        },
        items: durations!.map((value){
          return DropdownMenuItem(
              value: value,
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 40,
                    width: 40,
                    child: Icon(Icons.access_time_filled,color: Colors.blueAccent,),
                  ),
                  const SizedBox(width: 5,),
                  Flexible(
                      flex: 2,
                      child:
                  SizedBox(
                    width: 200,
                    child: Text(value),
                  )),
                  const Flexible(
                      flex: 1,
                      child:
                  SizedBox(width: 50,)),
                ],
              ));
        }).toList(),
      ),
    )
    );
  }

}