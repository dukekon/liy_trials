import 'package:flutter/material.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({super.key});

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black87),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.5,
          title: const Text('Record', style: TextStyle(color: Colors.black87)),
        ),
        body: Column(children: [
          Container(),
        ]));
  }
}
