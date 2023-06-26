import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../models/record_model.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({this.result, super.key});

  final String? result;

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  final List<RecordModel> _records = [];
  bool _isSubmited = false;

  @override
  void initState() {
    super.initState();
    _readRecords();
  }

  Future<void> _readRecords() async {
    final file = await checkFile();
    final data = await file.readAsString();
    jsonDecode(data).forEach((record) {
      setState(() => _records.add(RecordModel.fromJson(record)));
    });
  }

  Future<File> checkFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/save/records.json');
    if (!(await file.exists())) {
      await file.create(recursive: true);
    }
    return file;
  }

  void _onSubmit(text) async {
    setState(() {
      _records.add(RecordModel(name: text, result: widget.result!));
      _isSubmited = true;
    });
    _onSave();
  }

  void _onClear() async {
    setState(() => _records.clear());
    _onSave();
  }

  void _onSave() async {
    final file = await checkFile();
    await file.writeAsString(jsonEncode(_records));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black87),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.5,
          title: const Text('Record', style: TextStyle(color: Colors.black87)),
          actions: [
            IconButton(
                onPressed: () => _onClear(),
                icon: const Icon(Icons.delete_outline_outlined,
                    color: Colors.black87))
          ],
        ),
        body: Column(children: [
          widget.result == null || _isSubmited
              ? const SizedBox()
              : Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  child: Column(children: [
                    Row(children: [
                      const Text('Result: ',
                          style:
                              TextStyle(fontSize: 20, color: Colors.black26)),
                      Text(widget.result!,
                          style: TextStyle(
                              fontSize: 20,
                              color: widget.result == 'Fail'
                                  ? Colors.red
                                  : Colors.blue)),
                    ]),
                    const SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        labelText: 'Enter Username',
                      ),
                      onSubmitted: _onSubmit,
                    )
                  ]),
                ),
          Expanded(
              child: ListView.builder(
                  // padding: const EdgeInsets.symmetric(horizontal: 32),
                  itemCount: _records.length,
                  itemBuilder: (context, idx) {
                    return ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 32),
                      title: Text(_records[idx].name),
                      trailing: Text(
                          _records[idx].result == 'Fail'
                              ? 'Fail'
                              : _records[idx]
                                  .result
                                  .replaceAll('Passed! Time:', ''),
                          style: TextStyle(
                              color: _records[idx].result == 'Fail'
                                  ? Colors.red
                                  : Colors.blue)),
                      onTap: () => print(_records[idx].name),
                    );
                  }))
        ]));
  }
}
