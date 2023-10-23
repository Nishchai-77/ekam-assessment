import 'package:ekam_assesment/feature/providers/time_periods_state_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodels/time_periods_viewmodel.dart';

class TimeListWidget extends ConsumerStatefulWidget{
  const TimeListWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return TimeListWidgetState();
  }

}

class TimeListWidgetState extends ConsumerState<TimeListWidget>{

  late TimePeriodsViewModel timePeriodsViewModel;

  List<bool> valList = [true,false,false,false];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      timePeriodsViewModel = ref.read(timePeriodViewModelProvider);
    });
  }



    @override
    Widget build(BuildContext context) {

    final timePeriodState = ref.watch(timePeriodsStateProvider);

    final timePeriods = timePeriodState.timePeriods;

    List<String> dataList = [];

    for(var t in timePeriods!){
      print(t);

      var strList = t.split("-");

      for(String s in strList){
        dataList.add(s);
      }
      setState(() {

      });

    }

      Widget builderContainer(int index){

        return GestureDetector(
            onTap: (){
              //print(index);
              for(int i=0;i<4;i++){
                //print(i);
                if(i==index){
                  valList[index] = true;
                }else{
                  valList[i] = false;
                }
              }

              setState(() {

              });
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
                    Text(dataList[index],style: TextStyle(color:valList[index]?Colors.white:Colors.black),),
                    const SizedBox(height: 1,),
                    // Text("Oct ${dates[index]}",style: TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //     color:valList[index]?Colors.white:Colors.black),)
                  ],
                ))
        );

      }

      return Center(
          child:SizedBox(
        height: 55,
        child: ListView.builder(
            itemCount:dataList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context,int index){
              return builderContainer(index);
            }),
      )
      );
    }

}