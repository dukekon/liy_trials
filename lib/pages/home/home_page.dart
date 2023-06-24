import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:liy_trials/models/trials_model.dart';
import 'package:liy_trials/pages/home/widgets/trials_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TrialModel> trials = [];

  @override
  void initState() {
    super.initState();
    rootBundle.loadString('lib/jsons/trialsList.json').then((json) {
      jsonDecode(json).forEach((trial) {
        setState(() {
          trials.add(TrialModel.fromJson(trial));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.5,
          title:
              const Text('Liy Trials', style: TextStyle(color: Colors.black87)),
        ),
        body: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: trials.length,
            itemBuilder: (context, idx) {
              return TrialsItem(item: trials[idx]);
            }));
  }
}
