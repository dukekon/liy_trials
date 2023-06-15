import 'package:flutter/material.dart';
import 'package:liy_trials/pages/home/widgets/trials_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // todo navigator bar
        appBar: AppBar(
          title: const Text('Trials',
              style: TextStyle(
                color: Color(0xff333333),
              )),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        // todo body
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: const [TrialsItem()],
        ));
  }
}
