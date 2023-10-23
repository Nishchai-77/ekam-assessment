import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12, width: 2),
              borderRadius: BorderRadius.circular(30),
            ),
            child:GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back)),
          ),
          const SizedBox(
            width: 50,
          ),
          Expanded(
              child: Text(
            title,
            style: const TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ))
        ],
      ),
    );
  }
}
