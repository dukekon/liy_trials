import 'package:flutter/material.dart';

class SuctionState extends StatefulWidget {
  SuctionState({required this.state, required this.position, Key? key})
      : super(key: key);
  final ValueNotifier<bool> state;
  String position = 'Not Enter';

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
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text('Tube Position', style: TextStyle(fontSize: 20)),
            Text(widget.position,
                style: const TextStyle(fontSize: 20, color: Colors.blue)),
          ]),
        ]));
  }
}
