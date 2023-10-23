import 'dart:convert';

import 'package:ekam_assesment/api_service.dart';
import 'package:ekam_assesment/feature/domain/model/package_details.dart';
import 'package:ekam_assesment/feature/providers/package_details_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final packageDetailVmProvider = Provider.autoDispose((ref) => PackageDetailsViewModel(ref));

class PackageDetailsViewModel{

  PackageDetailsViewModel(this.ref){
    packageDetailsResNotifier = ref.read(packageDetailsStateProvider.notifier);
    apiService = ref.read(apiServiceProvider);
  }

  Ref ref;
  late PackageDetailsResNotifier packageDetailsResNotifier;
  late ApiService apiService;

  void getPackageDetails(){
    packageDetailsResNotifier.toggleLoading(true);
    apiService.getPackageDetails().then((value){
      packageDetailsResNotifier.toggleLoading(false);
      final packageDetails = PackageDetails.fromJson(value);
      print(packageDetails);
      packageDetailsResNotifier.updatePackageDetails(packageDetails);
    });
  }

}