import 'dart:convert';

import 'package:ekam_assesment/api_service.dart';
import 'package:ekam_assesment/feature/domain/model/doctors_details.dart';
import 'package:ekam_assesment/feature/providers/doctors_detail_state_provider.dart';
import 'package:ekam_assesment/feature/viewmodels/time_periods_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final viewModelProvider = Provider.autoDispose((ref) => DoctorsDetailViewModel(ref));


class DoctorsDetailViewModel{


  late ApiService apiService;
  late DoctorsDetailResNotifier doctorsDetailResNotifier;
  late TimePeriodsViewModel timePeriodsViewModel;
  Ref ref;

  DoctorsDetailViewModel(this.ref){
    apiService = ref.read(apiServiceProvider);
    doctorsDetailResNotifier = ref.read(doctorsDetailsStateProvider.notifier);
    timePeriodsViewModel = ref.read(timePeriodViewModelProvider);
  }

 void getDoctorsDetail() async{
    doctorsDetailResNotifier.toggleLoading(true);
    await apiService.getDoctorsDetails().then((value){
      doctorsDetailResNotifier.toggleLoading(false);
      final list = doctorDetailsFromJson(jsonEncode(value));
      doctorsDetailResNotifier.updateDoctorsDetails(list[0]);
      timePeriodsViewModel.updateTimePeriods(list[0]!.availability!.s1!, 0);
    });
 }


}