import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class VisualView extends StatefulWidget {
  const VisualView({super.key});

  @override
  State<VisualView> createState() => _VisualViewState();
}

class _VisualViewState extends State<VisualView> {
  final animationPath = 'assets/animation.riv';
  late SMITrigger _start;
  late SMITrigger _reset;
  late SMIInput<bool> _throat;

  void _onAnimateInit(Artboard artBoard) {
    final controller =
        StateMachineController.fromArtboard(artBoard, 'ani_state');

    artBoard.addController(controller!);
    _start = controller.findInput<bool>('start') as SMITrigger;
    _reset = controller.findInput<bool>('reset') as SMITrigger;
    _throat = controller.findInput<bool>('throat') as SMIBool;
  }

  void _toStart() => _start.fire();

  void _toReset() => _reset.fire();

  void _toThroat() => _throat.value = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _toStart();
      },
      onDoubleTap: () {
        _toThroat();
      },
      child: RiveAnimation.asset(
        animationPath,
        onInit: _onAnimateInit,
        fit: BoxFit.contain,
      ),
    );
  }
}
