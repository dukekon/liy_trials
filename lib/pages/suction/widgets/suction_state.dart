import 'package:flutter/material.dart';

class SuctionState extends StatefulWidget {
  const SuctionState({Key? key}) : super(key: key);

  @override
  State<SuctionState> createState() => _SuctionStateState();
}

class _SuctionStateState extends State<SuctionState> {
  @override
  Widget build(BuildContext context) {
    return Container(
        // margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        color: Colors.white,
        child: const Column(children: [
          Row(children: [
            Text('Tube Location', style: TextStyle(fontSize: 20)),
            Spacer(),
            Text('Throat', style: TextStyle(fontSize: 20, color: Colors.blue)),
          ]),
        ]));
  }
}
