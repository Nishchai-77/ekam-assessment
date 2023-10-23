import 'package:ekam_assesment/feature/providers/doctors_detail_state_provider.dart';
import 'package:ekam_assesment/feature/providers/time_periods_state_provider.dart';
import 'package:ekam_assesment/feature/viewmodels/time_periods_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DateListWidget extends ConsumerStatefulWidget{
  const DateListWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return DateListWidgetState();
  }
  
}

class DateListWidgetState extends ConsumerState{

  late TimePeriodsViewModel timePeriodsViewModel;


  @override
  void initState(){
    super.initState();
    Future.delayed(Duration.zero,()async{
      timePeriodsViewModel = ref.read(timePeriodViewModelProvider);
    });

  }


  List<bool> valList = [true,false,false,false];

  List<String> days = ["Today","Mon","Tue","Wed"];

  List<String> dates = ["18","19","20","21"];

  @override
  Widget build(BuildContext context) {

    final doctorsDetailsState = ref.watch(doctorsDetailsStateProvider);

    final details = doctorsDetailsState.doctorsDetails.availability;

    Widget builderContainer(int index){

      return GestureDetector(
          onTap: (){
            for(int i=0;i<4;i++){
              //print(i);
              if(i==index){
                valList[index] = true;
              }else{
                valList[i] = false;
              }
            }



            if(index == 0) {
              timePeriodsViewModel.updateTimePeriods(details!.s1!,index);
            }
            if(index == 1){
              timePeriodsViewModel.updateTimePeriods([], index);
            }
            if(index == 2){
              timePeriodsViewModel.updateTimePeriods(details!.s3!, index);
            }
            if(index == 3){
              timePeriodsViewModel.updateTimePeriods(details!.s4!, index);
            }

            setState(() {

            });
            //print(index);
          },
          child:Container(
              width: 90,
              margin: const EdgeInsets.only(left: 20),
              decoration:  BoxDecoration(
                color:valList[index]?Colors.indigoAccent:Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color:Colors.black12),
              ),
              child:Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(days[index],style: TextStyle(color:valList[index]?Colors.white:Colors.black),),
                  const SizedBox(height: 1,),
                  Text("Oct ${dates[index]}",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:valList[index]?Colors.white:Colors.black),)
                ],
              ))
      );

    }

    return Center(child:SizedBox(
      height: 55,
      child: ListView.builder(
          itemCount:4,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context,int index){
              return builderContainer(index);
      }),
    )
    );
  }


  
}