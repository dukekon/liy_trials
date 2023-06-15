import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class VisualControl extends StatefulWidget {
  const VisualControl({super.key});

  @override
  State<VisualControl> createState() => _VisualControlState();
}

class _VisualControlState extends State<VisualControl> {
  late Timer _timer;
  bool _isStart = false;
  int _countTime = 0;
  double _percent = 0;

  void _startTimer() {
    if (_isStart) return;
    _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      if (_countTime < 1500) {
        setState(() {
          _isStart = true;
          _countTime++;
          _percent = _countTime / 1500;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  void _resetTimer() {
    setState(() {
      _timer.cancel();
      _isStart = false;
      _countTime = 0;
      _percent = 0;
    });
  }

  String _formatTime(int value) {
    if (value < 10) {
      return '0$value';
    } else {
      return '$value';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.all(24),
        height: 150,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              offset: const Offset(0, 1),
              blurRadius: 4,
              spreadRadius: 1)
        ]),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OutlinedButton(onPressed: _resetTimer, child: const Text('Reset')),
            Expanded(
                flex: 1,
                child: CircularPercentIndicator(
                  percent: _percent,
                  radius: 60,
                  lineWidth: 8,
                  circularStrokeCap: CircularStrokeCap.round,
                  backgroundColor: const Color(0xffF5F5F5),
                  center: const AnimatedSwitcher(
                    duration: Duration(seconds: 1),
                    child: Icon(
                      Icons.file_download_outlined,
                      size: 48,
                      color: Colors.blue,
                    ),
                  ),
                  // center: Text(
                  //   '${_formatTime(_countTime ~/ 100)}: ${(_formatTime(_countTime % 100))}',
                  //   style: const TextStyle(fontSize: 24, color: Colors.black87),
                  // ),
                  progressColor: Colors.blue,
                )),
            OutlinedButton(
              onPressed: _startTimer,
              child: const Text('Start'),
            ),
          ],
        ));
  }
}
