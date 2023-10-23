import 'package:ekam_assesment/feature/providers/time_periods_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final timePeriodViewModelProvider = Provider.autoDispose((ref) => TimePeriodsViewModel(ref: ref));

class TimePeriodsViewModel{

  Ref ref;
  late TimePeriodsResNotifier timePeriodsResNotifier;

  TimePeriodsViewModel({required this.ref}){
    timePeriodsResNotifier = ref.read(timePeriodsStateProvider.notifier);
  }

  void updateTimePeriods(List<String> data,int index){
    timePeriodsResNotifier.updateTimePeriods(data, index);
  }

}