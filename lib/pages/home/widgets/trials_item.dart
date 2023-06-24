import 'package:flutter/material.dart';
import 'package:liy_trials/models/trials_model.dart';
import 'package:liy_trials/widgets/AppButton.dart';

class TrialsItem extends StatelessWidget {
  const TrialsItem({required this.item, super.key});

  final TrialModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.asset(item.image),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.name,
                            style: const TextStyle(
                                fontSize: 22,
                                // fontWeight: FontWeight.bold,
                                color: Colors.blue)),
                        const SizedBox(height: 4),
                        Text(item.description,
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[400])),
                      ]),
                  AppButton(text: 'Start', onPressed: () {})
                ]),
          ),
        ]));
  }
}
