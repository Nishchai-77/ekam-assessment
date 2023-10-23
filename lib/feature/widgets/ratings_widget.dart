import 'package:ekam_assesment/feature/providers/doctors_detail_state_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RatingsWidget extends ConsumerWidget {
  const RatingsWidget({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final doctorsDetailsState = ref.watch(doctorsDetailsStateProvider);

    final doctorsDetail = doctorsDetailsState.doctorsDetails;

    Widget ratingIcons() {
      return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffDAE0FF),
              //border: Border.all(color: Colors.lightBlue),
              // borderRadius: BorderRadius.circular(20)
            ),
            child: const Icon(
              Icons.people_alt,
              color: Colors.blueAccent,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffDAE0FF),
              //border: Border.all(color: Colors.lightBlue),
              // borderRadius: BorderRadius.circular(20)
            ),
            child: const Icon(
              Icons.medical_services,
              color: Colors.blueAccent,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffDAE0FF),
              //border: Border.all(color: Colors.lightBlue),
              // borderRadius: BorderRadius.circular(20)
            ),
            child: const Icon(
              Icons.star_half_sharp,
              color: Colors.blueAccent,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffDAE0FF),
              //border: Border.all(color: Colors.lightBlue),
              // borderRadius: BorderRadius.circular(20)
            ),
            child: const Icon(
              Icons.rate_review,
              color: Colors.blueAccent,
              size: 30,
            ),
          )
        ],
      );
    }

    Widget ratingDetailsContainer() {
      return Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                children: [
                  Text(
                    "${doctorsDetail.patientsServed}+",
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Patients",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  children: [
                    Text(
                      "${doctorsDetail.yearsOfExperience}+",
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "years Exp.",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  children: [
                    Text(
                      "${doctorsDetail.rating}+",
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Rating",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 0),
                  child: Column(
                    children: [
                      Text(
                        "${doctorsDetail.numberOfReviews}",
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Reviews",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ))
            ],
          ));
    }

    return Container(
        //padding: const EdgeInsets.all(20),
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: ratingIcons(),
        ),
        ratingDetailsContainer(),
        const SizedBox(height: 40,),
        const Padding(padding: EdgeInsets.only(left: 20),child:
        Align(
            alignment: Alignment.centerLeft,
            child:
        Text("BOOK APPOINTMENT",
          textAlign: TextAlign.left,
          style: TextStyle(color: Colors.black26,fontSize: 16,),)),)
      ],
    ));
  }
}
