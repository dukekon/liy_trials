import 'package:flutter/material.dart';
import 'package:liy_trials/pages/suction/widgets/status_info.dart';
import 'package:liy_trials/pages/suction/widgets/visual_control.dart';
import 'package:liy_trials/pages/suction/widgets/visual_view.dart';

class SuctionPage extends StatefulWidget {
  const SuctionPage({super.key});

  @override
  State<SuctionPage> createState() => _SuctionPageState();
}

class _SuctionPageState extends State<SuctionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      // todo navigator bar
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.home_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
          color: const Color(0xff333333),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.bug_report),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      // todo body
      body: const Column(children: [
        SizedBox(
          height: 300,
          child: VisualView(),
        ),
        // todo Status
        StatusInfo(),
        // todo Control
        Expanded(
          flex: 1,
          child: VisualControl(),
        )
      ]),
    );
  }
}
