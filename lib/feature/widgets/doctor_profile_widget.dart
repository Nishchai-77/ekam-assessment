import 'package:cached_network_image/cached_network_image.dart';
import 'package:ekam_assesment/feature/providers/doctors_detail_state_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DoctorsProfileWidget extends ConsumerWidget {
  const DoctorsProfileWidget({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final doctorsDetailState = ref.watch(doctorsDetailsStateProvider);

    final doctorsDetail = doctorsDetailState.doctorsDetails;

    Widget profileCamera() {
      return const SizedBox(
          height: 30,
          width: 30,
          child: Icon(
            Icons.verified,
            color: Colors.blueAccent,
          ));
    }

    Widget profilePicContainer() {
      return Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            //border: Border.all(color: Colors.black12)
            /*Border.all(
                color: AppColors.gradientdarkPurple,
                width: AppSizes.lp08,
              )*/
          ),
          child: Stack(
              alignment: Alignment.bottomRight,
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10000.0),
                    child: /*(imagePicked == null)
                            ?*/
                    CachedNetworkImage(
                        fit: BoxFit.cover,
                        height: 120,
                        width: 120,
                        imageUrl: "${doctorsDetail.image}")
                  /*: Image.file(
                                imagePicked!,
                                fit: BoxFit.cover,
                                height: AppSizes.lp100,
                                width: AppSizes.lp100,
                              )*/
                ),

                /*Image.asset(AppAssets.imagesIcProfilePlaceholder,
                      width: AppSizes.lp100, height: AppSizes.lp100,),*/
                Positioned(bottom: 5, right: -2, child: profileCamera()),
              ]));
    }

    Widget detailsContainer() {
      return Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: const EdgeInsets.only(right: 70),
        child:
            Text("${doctorsDetail.doctorName}", style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),),
            const SizedBox(height: 5,),
            Padding(padding: const EdgeInsets.only(right: 100),
            child:
            Text("${doctorsDetail.speciality}",
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),),
            const SizedBox(height: 10,),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: 10,),
                const Icon(Icons.location_on, color: Colors.blueAccent,),
                Text("${doctorsDetail.location}", style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16
                ),),
                const SizedBox(width: 10,),
                const Icon(Icons.map,color: Colors.blueAccent,)
              ],
            )
          ],

        ),
      );
    }


    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          profilePicContainer(),
          detailsContainer(),
        ],
      )
    );
  }
}
