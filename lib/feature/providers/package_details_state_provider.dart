import 'package:ekam_assesment/feature/domain/model/package_detail_enity.dart';
import 'package:ekam_assesment/feature/domain/model/package_details.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final packageDetailsStateProvider = StateNotifierProvider<PackageDetailsResNotifier,PackageDetailEntity>((ref) => PackageDetailsResNotifier(ref: ref));

class PackageDetailsResNotifier extends StateNotifier<PackageDetailEntity>{
  PackageDetailsResNotifier({required this.ref}):super(PackageDetailEntity(packageDetails:PackageDetails(), loading: true));
  Ref ref;

  void updatePackageDetails(PackageDetails packageDetails){
    final package = PackageDetailEntity(packageDetails: packageDetails, loading: false);
    state = package;
  }

  void toggleLoading(bool loading){
    final package = PackageDetailEntity(packageDetails: state.packageDetails, loading: loading);
    state = package;
  }


}