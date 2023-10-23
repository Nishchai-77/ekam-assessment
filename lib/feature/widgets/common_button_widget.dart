import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CommonButton extends StatelessWidget {
  const CommonButton(
      {Key? key, required this.buttonName, required this.callback})
      : super(key: key);
  final String buttonName;
  final VoidCallback callback;

  Widget buttonText(buttonName) => Text(
    buttonName,
    style: const TextStyle(
        color: Colors.white, fontSize: 16),
  );

  Widget buttonSecondaryContainer() => Container(
    width: double.infinity,
    height: 50,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: CupertinoColors.activeBlue,
      borderRadius: BorderRadius.circular(40.0),
    ),
    child: buttonText(buttonName),
  );

  Widget buttonInitialContainer() => Container(
    width: double.infinity,
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
