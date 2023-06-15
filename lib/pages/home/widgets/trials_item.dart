import 'package:flutter/material.dart';
import 'package:liy_trials/pages/suction/suction.dart';

class TrialsItem extends StatelessWidget {
  const TrialsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(0, 1),
              blurRadius: 4,
            )
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Image.asset('assets/images/trials_list_01.webp'),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SUCTIONING',
                          style: TextStyle(
                              fontSize: 16,
                              height: 1.5,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Timed training for suction',
                          style: TextStyle(
                              fontSize: 14, height: 1.5, color: Colors.black26),
                        ),
                      ],
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SuctionPage()));
                    },
                    style: ButtonStyle(
                        side: MaterialStateProperty.all(
                            const BorderSide(color: Colors.blue)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 24))),
                    child: const Text('Start'),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
