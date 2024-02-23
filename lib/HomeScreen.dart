

import 'package:calculator/constants.dart' show constants;
import 'package:calculator/custum_button.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _State();
}

class _State extends State<MyHome> {
  String exp = '';
  String history = '';
  double num1 = 0;
  double num2 = 0;
  String op = '';

  void numClick(String btnText) {
    if (btnText == 'AC') {
      setState(() {
        exp = '';
        history = '';
      });
      num1 = 0;
      num2 = 0;
    } else if (btnText == 'C') {
      setState(() {
        exp = '';
      });
    } else if (btnText == '%' ||
        btnText == '/' ||
        btnText == 'X' ||
        btnText == '-' ||
        btnText == '+') {
      op = btnText;
      num1 = double.parse(exp);
      setState(() {
        exp = '';
        history = num1.toString();
        history += btnText;
      });
    } else if (btnText == '.') {
      if (exp.contains('.')) {
      } else {
        setState(() {
          exp += btnText;
        });
      }
    } else if (btnText == '=') {
      num2 = double.parse(exp);
      history += exp;

      switch (op) {
        case '+':
          exp = (num1 + num2).toString();
          break;
        case 'X':
          exp = (num1 * num2).toString();
          break;
        case '-':
          exp = (num1 - num2).toString();
          break;
        case '%':
          exp = (num1 % num2).toString();
          break;
        case '/':
          num2 == 0
              ? exp = 'UnValid Operation'
              : exp = (num1 / num2).toString();
          break;
        default:
          break;
      }
      setState(() {});
    } else {
      setState(() {
        exp += btnText;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Calculator',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            child: Text(history, style: constants.style1),
            alignment: Alignment.centerRight,
          ),
          const Divider(
            color: Colors.grey,
            thickness: 5,
          ),
          Container(
              alignment: Alignment.centerRight,
              child: Text(
                exp,
                style: constants.style1,
              )),
          Row(
            children: [
              custumButton(
                btnColor: Colors.grey, btnText: 'AC',
                //flex: null,
                callBack: numClick,
              ),
              custumButton(
                btnColor: Colors.grey,
                btnText: 'C',
                //flex: null,
                callBack: numClick,
              ),
              custumButton(
                btnColor: Colors.grey,
                btnText: '%',
                //flex: null,
                callBack: numClick,
              ),
              custumButton(
                btnColor: Colors.orangeAccent,
                btnText: '/',
                //flex: null,
                callBack: numClick,
              ),
            ],
          ),
          Row(
            children: [
              custumButton(
                btnColor: const Color.fromARGB(120, 128, 128, 128),
                btnText: '7',
                //flex: null,
                callBack: numClick,
              ),
              custumButton(
                btnColor: const Color.fromARGB(120, 128, 128, 128),
                btnText: '8',
                //flex: null,
                callBack: numClick,
              ),
              custumButton(
                btnColor: const Color.fromARGB(120, 128, 128, 128),
                btnText: '9',
                //flex: null,
                callBack: numClick,
              ),
              custumButton(
                btnColor: Colors.orangeAccent,
                btnText: 'X',
                //flex: null,
                callBack: numClick,
              ),
            ],
          ),
          Row(
            children: [
              custumButton(
                btnColor: const Color.fromARGB(120, 128, 128, 128),
                btnText: '4',
                //flex: null,
                callBack: numClick,
              ),
              custumButton(
                btnColor: const Color.fromARGB(120, 128, 128, 128),
                btnText: '5',
                //flex: null,
                callBack: numClick,
              ),
              custumButton(
                btnColor: const Color.fromARGB(120, 128, 128, 128),
                btnText: '6',
                // flex: null,
                callBack: numClick,
              ),
              custumButton(
                btnColor: Colors.orangeAccent,
                btnText: '-',
                //flex: null,
                callBack: numClick,
              ),
            ],
          ),
          Row(
            children: [
              custumButton(
                btnColor: const Color.fromARGB(120, 128, 128, 128),
                btnText: '1',
                //flex: null,
                callBack: numClick,
              ),
              custumButton(
                btnColor: const Color.fromARGB(120, 128, 128, 128),
                btnText: '2',
                // flex: null,
                callBack: numClick,
              ),
              custumButton(
                btnColor: const Color.fromARGB(120, 128, 128, 128),
                btnText: '3',
                //flex: null,
                callBack: numClick,
              ),
              custumButton(
                btnColor: Colors.orangeAccent,
                btnText: '+',
                // flex: null,
                callBack: numClick,
              ),
            ],
          ),
          Row(
            children: [
              custumButton(
                btnColor: const Color.fromARGB(120, 128, 128, 128),
                btnText: '0',
                flex: 2,
                callBack: numClick,
              ),
              custumButton(
                btnColor: const Color.fromARGB(120, 128, 128, 128),
                btnText: '.',
                //flex: null,
                callBack: numClick,
              ),
              custumButton(
                btnColor: Colors.orangeAccent,
                btnText: '=',
                //flex: null,
                callBack: numClick,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
