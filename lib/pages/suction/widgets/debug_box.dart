import 'package:flutter/material.dart';

class DebugBox extends StatefulWidget {
  const DebugBox({required this.inputPosition, Key? key}) : super(key: key);
  final Function(String position) inputPosition;

  @override
  State<DebugBox> createState() => _DebugBoxState();
}

class _DebugBoxState extends State<DebugBox> {
  bool one = false;
  bool two = false;
  bool three = false;
  bool four = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 40,
        // height: 120,
        decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            )),
        child: Column(children: [
          TextButton(
              onPressed: () {
                widget.inputPosition(one ? 'no throat' : 'throat');
                setState(() {
                  one = !one;
                });
              },
              child: const Icon(
                Icons.looks_one_outlined,
                color: Colors.white,
              )),
          TextButton(
              onPressed: () {
                widget.inputPosition(two ? 'no trachea' : 'trachea');
                setState(() {
                  two = !two;
                });
              },
              child: const Icon(
                Icons.looks_two_outlined,
                color: Colors.white,
              )),
          TextButton(
              onPressed: () {
                widget.inputPosition(three ? 'no lung' : 'lung');
                setState(() {
                  three = !three;
                });
              },
              child: const Icon(
                Icons.looks_3_outlined,
                color: Colors.white,
              )),
          TextButton(
              onPressed: () {
                widget.inputPosition(four ? 'no maw' : 'maw');
                setState(() {
                  four = !four;
                });
              },
              child: const Icon(
                Icons.looks_4_outlined,
                color: Colors.white,
              )),
        ]));
  }
}
