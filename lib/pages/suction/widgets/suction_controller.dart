import 'dart:async';

import 'package:flutter/material.dart';
import 'package:liy_trials/pages/record.dart';
import 'package:liy_trials/utils/time.dart';
import 'package:liy_trials/widgets/app_button.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SuctionController extends StatefulWidget {
  SuctionController(
      {required this.changeStart, required this.position, super.key});

  final Function(bool isStarted) changeStart;
  ValueNotifier<String> position;

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
  bool _throughLung = false;
  bool _throughThroat = false;
  String _result = '';

  void _onStart() {
    if (_isStarted) return;
    _isStarted = true;
    widget.changeStart(_isStarted);
    _timer = Timer.periodic(duration, (timer) {
      if (_totalTime >= 1500 ||
          (widget.position.value == 'no throat' && _throughLung) ||
          (widget.position.value == 'maw' && _throughThroat)) {
        if (widget.position.value == 'no throat') {
          setState(() => _result = 'success');
        } else {
          setState(() => _result = 'fail');
        }
        timer.cancel();
        return;
      } else {
        setState(() {
          if (widget.position.value == 'lung') {
            setState(() => _throughLung = true);
          }
          if (widget.position.value == 'throat') {
            setState(() => _throughThroat = true);
          }
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
      _result = '';
      _throughLung = false;
      _throughThroat = false;
    });
    widget.changeStart(_isStarted);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Column(children: [
        SizedBox(
            height: 32,
            child: _result != ''
                ? Container(
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: _result == 'success'
                          ? Colors.green[400]
                          : Colors.red[400],
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                        _result == 'success'
                            ? 'Success!  Time: $_seconds: $_milliseconds'
                            : 'Fail!',
                        style: const TextStyle(color: Colors.white)))
                : null),
        const SizedBox(height: 24),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          _isStarted
              ? AppButton(text: 'Reset', onPressed: _onReset)
              : AppButton(text: 'Reset', customColor: Colors.grey[300]),
          CircularPercentIndicator(
              percent: _percent,
              lineWidth: 8,
              radius: 60,
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Colors.blue,
              backgroundColor: Colors.grey[200]!,
              center: _isStarted
                  ? Text(
                      '${TimeControl.format(_seconds)} : ${TimeControl.format(_milliseconds)}',
                      style: const TextStyle(fontSize: 20))
                  : TextButton(
                      onPressed: _onStart,
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(38),
                        shape: const CircleBorder(),
                      ),
                      child:
                          const Text('Start', style: TextStyle(fontSize: 20)),
                    )),
          _result != ''
              ? AppButton(
                  text: 'Save',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RecordPage()));
                  })
              : AppButton(text: 'Save', customColor: Colors.grey[300])
        ])
      ]),
    );
  }
}
