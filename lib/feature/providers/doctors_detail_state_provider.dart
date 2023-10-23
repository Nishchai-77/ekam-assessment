import 'package:ekam_assesment/feature/domain/model/doctors_detail_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/model/doctors_details.dart';

final doctorsDetailsStateProvider = StateNotifierProvider<DoctorsDetailResNotifier,DoctorsDetailsEntity>((ref) => DoctorsDetailResNotifier(ref));

class DoctorsDetailResNotifier extends StateNotifier<DoctorsDetailsEntity>{
  Ref ref;
  DoctorsDetailResNotifier(this.ref):super(DoctorsDetailsEntity(doctorsDetails: DoctorsDetails(), loading:true));

  void updateDoctorsDetails(DoctorsDetails doctorsDetails){
      final doctorsDetailEntity = DoctorsDetailsEntity(doctorsDetails: doctorsDetails, loading: state.loading);
      state = doctorsDetailEntity;
  }

  void toggleLoading(bool loading){
    final doctorsDetailEntity = DoctorsDetailsEntity(doctorsDetails: state.doctorsDetails, loading: loading);
    state = doctorsDetailEntity;
  }



}