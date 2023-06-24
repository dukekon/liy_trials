import 'package:flutter/material.dart';
import 'package:liy_trials/pages/suction/widgets/suction_controller.dart';
import 'package:liy_trials/pages/suction/widgets/suction_state.dart';
import 'package:liy_trials/pages/suction/widgets/suction_visualization.dart';

class SuctionPage extends StatefulWidget {
  const SuctionPage({super.key});

  @override
  State<SuctionPage> createState() => _SuctionPageState();
}

class _SuctionPageState extends State<SuctionPage> {
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
              onPressed: () {},
            ),
          ],
        ),
        body: Column(children: [
          const SuctionVisualization(),
          const SuctionState(),
          const SizedBox(height: 8),
          Expanded(
              flex: 1,
              child: Container(
                  color: Colors.white,
                  child: const Column(children: [SuctionController()])))
        ]));
  }
}
