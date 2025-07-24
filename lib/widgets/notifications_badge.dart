import 'package:flutter/material.dart';

class NotificationBadge extends StatelessWidget {
  final int count;

  const NotificationBadge({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    if (count <= 0) {
      return const SizedBox.shrink();
    }
    return Positioned(
      right: 8,
      top: 8,
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(6),
        ),
        constraints: const BoxConstraints(minWidth: 14, minHeight: 14),
        child: Text(
          '$count',
          style: const TextStyle(color: Colors.white, fontSize: 8),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
