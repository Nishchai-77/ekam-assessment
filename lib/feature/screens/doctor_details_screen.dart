import 'package:ekam_assesment/feature/providers/doctors_detail_state_provider.dart';
import 'package:ekam_assesment/feature/screens/select_package_screen.dart';
import 'package:ekam_assesment/feature/viewmodels/doctors_detail_viewmodel.dart';
import 'package:ekam_assesment/feature/widgets/app_bar_widget.dart';
import 'package:ekam_assesment/feature/widgets/common_button_widget.dart';
import 'package:ekam_assesment/feature/widgets/date_list_widget.dart';
import 'package:ekam_assesment/feature/widgets/doctor_profile_widget.dart';
import 'package:ekam_assesment/feature/widgets/ratings_widget.dart';
import 'package:ekam_assesment/feature/widgets/time_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DoctorDetailsScreen extends ConsumerStatefulWidget {
  const DoctorDetailsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return DoctorsDetailsScreenState();
  }
}

class DoctorsDetailsScreenState extends ConsumerState {


  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      final doctorsDetailVm = ref.read(viewModelProvider);
      doctorsDetailVm.getDoctorsDetail();
    });
  }

  @override
  Widget build(BuildContext context) {
    final doctorsDetailState = ref.watch(doctorsDetailsStateProvider);

    final doctorDetail = doctorsDetailState.doctorsDetails;

    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: doctorsDetailState.loading
              ? const CircularProgressIndicator()
              : ListView(
                  children: [
                    const AppBarWidget(
                      title: 'Book Appointment',
                    ),
                    const DoctorsProfileWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Divider(
                          height: 3,
                          thickness: 0,
                          color: Colors.grey,
                        )),
                    const RatingsWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "Day",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const DateListWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "Time",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TimeListWidget(),
                    const SizedBox(
                      height: 80,
                    ),
                    // const Divider(height: 2,thickness: 0,indent: 20,endIndent: 20,color: Colors.grey,),
                    const SizedBox(
                      height: 20,
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
                              return const SelectPackageScreen();
                            }));
                      }),
                    ),
                    const SizedBox(
                      height: 40,
                    )
                  ],
                )),
    );
  }
}
