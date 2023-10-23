import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CommonButtonTwo extends StatelessWidget {
  const CommonButtonTwo(
      {Key? key, required this.buttonName, required this.callback,required this.buttonType})
      : super(key: key);
  final String buttonName;
  final VoidCallback callback;
  final int buttonType;

  Widget buttonText(buttonName) => Text(
    buttonName,
    style:  TextStyle(
        color:(buttonType == 1)?Colors.white:Colors.blueAccent, fontSize: 18,fontWeight: FontWeight.w400),
  );

  Widget buttonSecondaryContainer() => Container(
    width: 200,
    height: 50,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: (buttonType==1)?CupertinoColors.activeBlue:Color(0xFFDAE0FF),
      borderRadius: BorderRadius.circular(40.0),
    ),
    child: buttonText(buttonName),
  );

  Widget buttonInitialContainer() => Container(
    width: 200,
    padding: const EdgeInsets.fromLTRB(
        16, 0, 16, 0),
    child: Center(
      child: GestureDetector(
        onTap: callback,
        child: buttonSecondaryContainer(),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return buttonInitialContainer();
  }
}
