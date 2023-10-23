import 'package:ekam_assesment/feature/providers/package_details_state_provider.dart';
import 'package:ekam_assesment/feature/viewmodels/booking_details_review_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PackageTypeRadioBtnWidget extends ConsumerStatefulWidget {
  const PackageTypeRadioBtnWidget({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return PackageTypeRadioBtnState();
  }
}

class PackageTypeRadioBtnState extends ConsumerState<PackageTypeRadioBtnWidget> {
  int selectedVal = 0;

  //this data is not coming from server but it's there in ui screens as per requirements,so hardcoded
  List<String> packageDetailsDesc = ["chat with doctor","Voice call with doctor","video call with doctor","in person with doctor"];

  var iconsList = [Icons.message,Icons.call,Icons.video_camera_front_rounded,Icons.person];

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

    final packageDetails  = packageDetailsState.packageDetails!.package!;

    //bookingDetailsReViewModel.updateBookingsPkg(packageDetails[0]);

    return Center(
        child: ListView.builder(
            itemCount: packageDetails.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),child:Card(
                      elevation: 0,
                      child:Container(
                         // margin: EdgeInsets.all(20),
                        padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        flex:2 ,
                        child:
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffDAE0FF),
                          //border: Border.all(color: Colors.lightBlue),
                          // borderRadius: BorderRadius.circular(20)
                        ),
                        child: Icon(
                          iconsList[index],
                          color: Colors.blueAccent,
                          size: 25,
                        ),
                      ),
                      ),
                      const SizedBox(width: 10,),
                      Flexible(
                        flex: 3,
                        child:
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child:
                          Text(
                            packageDetails[index].toString(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),),
                          const SizedBox(height: 5,),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child:
                          Text(
                          packageDetailsDesc[index],
                            style:
                                const TextStyle(color: Colors.black38, fontSize: 14),
                          ),
                          ),
                        ],
                       ),),
                      const SizedBox(width: 100,),
                      Flexible(child:
                      Radio<int>(
                        value: index,
                        groupValue: selectedVal,
                        activeColor: Colors.blue,
                        // Change the active radio button color here
                        fillColor: MaterialStateProperty.all(Colors.blue),
                        // Change the fill color when selected
                        splashRadius: 25,
                        // Change the splash radius when clicked
                        onChanged: (int? value) {
                          bookingDetailsReViewModel.updateBookingsPkg(packageDetails[index]);
                          setState(() {
                            selectedVal = value!;
                          });
                        },
                      ),
                      ),
                    ],
                  ))
                  ));
            }));
  }
}
