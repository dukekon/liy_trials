import 'package:flutter/material.dart';
import 'package:liy_trials/pages/suction/widgets/debug_box.dart';
import 'package:liy_trials/pages/suction/widgets/suction_controller.dart';
import 'package:liy_trials/pages/suction/widgets/suction_state.dart';
import 'package:liy_trials/pages/suction/widgets/suction_visualization.dart';

class SuctionPage extends StatefulWidget {
  const SuctionPage({super.key});

  @override
  State<SuctionPage> createState() => _SuctionPageState();
}

class _SuctionPageState extends State<SuctionPage> {
  bool _showDebugBox = false;
  final ValueNotifier<bool> _isStartedNotifier = ValueNotifier<bool>(false);
  final ValueNotifier<String> _positionNotifier = ValueNotifier<String>('');
  String _position = 'Not Enter';

  void _changeStart(bool isStarted) {
    _isStartedNotifier.value = isStarted;
    if (!isStarted) {
      setState(() => _position = 'Not Enter');
    }
    print(
        _isStartedNotifier.value ? 'controller started' : 'controller stopped');
  }

  void _inputPosition(String position) {
    _positionNotifier.value = position;
  }

  void _onChangePosition(String position) {
    setState(() {
      _position = position;
    });
    print('position: $position');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.5,
          title: const Text('Suction', style: TextStyle(color: Colors.black87)),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings_outlined),
              color: Colors.black87,
              onPressed: () {
                setState(() => _showDebugBox = !_showDebugBox);
                print(_showDebugBox);
              },
            ),
          ],
        ),
        body: Column(children: [
          Stack(
            alignment: Alignment.centerRight,
            children: [
              SuctionVisualization(
                state: _isStartedNotifier,
                position: _positionNotifier,
                changePosition: _onChangePosition,
              ),
              _showDebugBox
                  ? DebugBox(inputPosition: _inputPosition)
                  : const SizedBox()
            ],
          ),
          SuctionState(
            state: _isStartedNotifier,
            position: _position,
          ),
          const SizedBox(height: 8),
          Expanded(
              flex: 1,
              child: Container(
                  color: Colors.white,
                  child: Column(children: [
                    SuctionController(changeStart: _changeStart)
                  ])))
        ]));
  }
}
