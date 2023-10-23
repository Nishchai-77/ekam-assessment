import 'package:ekam_assesment/feature/domain/model/package_details.dart';

class PackageDetailEntity{

  PackageDetailEntity({required this.packageDetails,required this.loading});

  bool loading;
  PackageDetails? packageDetails;

}