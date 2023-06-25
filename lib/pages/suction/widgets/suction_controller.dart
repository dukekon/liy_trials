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
  int _totalTime = 0;
  int _seconds = 0;
  int _milliseconds = 0;
  late Timer _timer;
  Duration duration = const Duration(milliseconds: 10);

  void _onStart() {
    if (_isStarted) return;
    _isStarted = true;
    _timer = Timer.periodic(duration, (timer) {
      if (_totalTime >= 1500) {
        timer.cancel();
        return;
      } else {
        setState(() {
          _totalTime++;
          _seconds = _totalTime ~/ 100;
          _milliseconds = _totalTime % 100;
          _percent = _totalTime / 1500;
        });
      }
    });
  }

  void _onReset() {
    setState(() {
      _timer.cancel();
      _isStarted = false;
      _percent = 0;
      _totalTime = 0;
      _seconds = 0;
      _milliseconds = 0;
    });
  }

  String _formatTime(int time) {
    return time < 10 ? '0$time' : '$time';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        AppButton(text: 'Reset', onPressed: _onReset),
        CircularPercentIndicator(
            percent: _percent,
            lineWidth: 8,
            radius: 60,
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Colors.blue,
            backgroundColor: Colors.grey[200]!,
            center: _isStarted
                ? Text(
                    '${_formatTime(_seconds)} : ${_formatTime(_milliseconds)}',
                    style: const TextStyle(fontSize: 20))
                : TextButton(
                    onPressed: _onStart,
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
