import 'package:flutter/material.dart';
import 'views/home_page.dart';

void main() {
  runApp(const ObraMaisApp());
}

class ObraMaisApp extends StatelessWidget {
  const ObraMaisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ObraMais',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PaginaInicial(),
    );
  }
}
