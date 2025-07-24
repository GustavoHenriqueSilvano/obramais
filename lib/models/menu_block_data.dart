import 'package:flutter/material.dart';

class MenuBlockData {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color? color;

  const MenuBlockData({
    required this.icon,
    required this.title,
    required this.onTap,
    this.color,
  });
}
