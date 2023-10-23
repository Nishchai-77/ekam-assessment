import 'package:ekam_assesment/feature/providers/booking_details_review_state_provider.dart';
import 'package:ekam_assesment/feature/providers/package_details_state_provider.dart';
import 'package:ekam_assesment/feature/screens/booking_review_screen.dart';
import 'package:ekam_assesment/feature/screens/doctor_details_screen.dart';
import 'package:ekam_assesment/feature/viewmodels/booking_details_review_viewmodel.dart';
import 'package:ekam_assesment/feature/viewmodels/package_details_viewmodel.dart';
import 'package:ekam_assesment/feature/widgets/app_bar_widget.dart';
import 'package:ekam_assesment/feature/widgets/package_type_radio_btn_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/common_button_widget.dart';
import '../widgets/duration_drop_down_widget.dart';

class SelectPackageScreen extends ConsumerStatefulWidget {
  const SelectPackageScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return SelectPackageScreenState();
  }
}

class SelectPackageScreenState extends ConsumerState<SelectPackageScreen> {

  late BookingDetailsReViewModel bookingDetailsReViewModel;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      final packageDetailVm = ref.read(packageDetailVmProvider);
      bookingDetailsReViewModel = ref.read(bookingsVmProvider);
      packageDetailVm.getPackageDetails();
    });
  }

  @override
  Widget build(BuildContext context) {

    final packageDetailsState = ref.watch(packageDetailsStateProvider);

    final bookingsState = ref.watch(bookingReviewStateProvider);

    return Scaffold(body:Center(
        child: packageDetailsState.loading
            ? const CircularProgressIndicator()
            : ListView(
                shrinkWrap: true,
                children: [
                  const AppBarWidget(title: 'Select Package'),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "Select Duration",
                      style: TextStyle(
                          color: CupertinoColors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: DurationDropDownWidget()),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "Select Package",
                      style: TextStyle(
                          color: CupertinoColors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const PackageTypeRadioBtnWidget(),
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
                        buttonName: "Next", callback: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            //return const ReviewSummaryScreen();
                            print(bookingsState.package);

                            return const BookingReviewScreen();
                          }));
                    }),
                  ),
                  const SizedBox(
                    height: 40,
                  )
                ],
              )));
  }
}
