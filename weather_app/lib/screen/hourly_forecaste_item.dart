import 'package:flutter/material.dart';

class HourlyForeCasteItem extends StatelessWidget {
  final String time;
  final IconData icon;
  final String tempreture;
  const HourlyForeCasteItem(
      {super.key,
      required this.icon,
      required this.time,
      required this.tempreture});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              time,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 8,
            ),
            Icon(
              icon,
              size: 32,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              tempreture,
            ),
          ],
        ),
      ),
    );
  }
}
