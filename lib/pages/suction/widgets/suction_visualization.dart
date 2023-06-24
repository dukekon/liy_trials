import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class SuctionVisualization extends StatefulWidget {
  const SuctionVisualization({Key? key}) : super(key: key);

  @override
  State<SuctionVisualization> createState() => _SuctionVisualizationState();
}

class _SuctionVisualizationState extends State<SuctionVisualization> {
  Artboard? _artboard;

// late StateMachineController _controller;

  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/animation.riv').then((data) async {
      final file = RiveFile.import(data);
      Artboard artboard = file.mainArtboard;
      StateMachineController controller =
          StateMachineController.fromArtboard(artboard, 'ani_state')!;
      artboard.addController(controller);
      setState(() => _artboard = artboard);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _artboard == null
        ? const SizedBox(height: 300)
        : Container(
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            height: 300,
            child: Rive(
              artboard: _artboard!,
              fit: BoxFit.fitHeight,
            ),
          );
  }
}
