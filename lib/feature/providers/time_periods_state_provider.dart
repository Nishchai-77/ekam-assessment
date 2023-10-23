import 'package:ekam_assesment/feature/domain/model/date_time_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final timePeriodsStateProvider = StateNotifierProvider<TimePeriodsResNotifier,DateTimeEntity>((ref) =>TimePeriodsResNotifier(ref) );

class TimePeriodsResNotifier extends StateNotifier<DateTimeEntity>{
  Ref ref;
  TimePeriodsResNotifier(this.ref):super((DateTimeEntity(timePeriods: [], index: 0)));

  void updateTimePeriods(List<String> data,int index){
    final timePeriods = DateTimeEntity(timePeriods: data, index: index);
    state = timePeriods;
  }


}