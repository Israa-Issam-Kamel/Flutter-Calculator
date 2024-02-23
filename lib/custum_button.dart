import 'package:calculator/constants.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class custumButton extends StatelessWidget {
  custumButton({
    Key? key,
    required this.btnColor,
    required this.btnText,
    this.flex,
    required this.callBack,
  }) : super(key: key);
  Color btnColor;
  String btnText;
  int? flex;
  Function callBack;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          callBack(btnText);
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.25,
          height: MediaQuery.of(context).size.height * 0.1,
          margin: const EdgeInsets.all(5),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(170),
            color: btnColor,
          ),
          child: Text(
            btnText,
            style: constants.btnTextStyle2,
          ),
        ),
      ),
      flex: flex == null ? 1 : flex!,
    );
  }
}
