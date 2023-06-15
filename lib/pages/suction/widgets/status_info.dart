import 'package:flutter/material.dart';

class StatusInfo extends StatefulWidget {
  const StatusInfo({super.key});

  @override
  State<StatusInfo> createState() => _StatusInfoState();
}

class _StatusInfoState extends State<StatusInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 0),
            blurRadius: 4,
          )
        ],
      ),
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tube Location', style: TextStyle(fontSize: 16)),
              Text(
                'None',
                style: TextStyle(fontSize: 16, color: Colors.blue),
              )
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Patient Status', style: TextStyle(fontSize: 16)),
              Text(
                'Normal',
                style: TextStyle(fontSize: 16, color: Colors.blue),
              )
            ],
          )
        ],
      ),
    );
  }
}
