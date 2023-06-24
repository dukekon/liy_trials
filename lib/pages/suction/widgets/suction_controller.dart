import 'dart:async';

import 'package:flutter/material.dart';
import 'package:liy_trials/widgets/AppButton.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SuctionController extends StatefulWidget {
  const SuctionController({super.key});

  @override
  State<SuctionController> createState() => _SuctionControllerState();
}

class _SuctionControllerState extends State<SuctionController> {
  bool _isStarted = false;
  double _percent = 0;
  int _seconds = 0;
  int _milliseconds = 0;
  Duration duration = const Duration(milliseconds: 10);

  void _onStart() {
    if (_isStarted) return;

    Timer.periodic(duration, (timer) {});

    setState(() {
      _isStarted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        AppButton(text: 'Reset', onPressed: () {}),
        CircularPercentIndicator(
            percent: 0,
            lineWidth: 8,
            radius: 60,
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Colors.blue,
            backgroundColor: Colors.grey[200]!,
            center: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(38),
                shape: const CircleBorder(),
              ),
              child: const Text('Start', style: TextStyle(fontSize: 20)),
            )),
        AppButton(text: 'Update', onPressed: () {}),
      ]),
    );
  }
}
