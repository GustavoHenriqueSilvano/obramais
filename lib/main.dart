import 'package:flutter/material.dart';
import 'views/login_page.dart';

void main() {
  runApp(const ObraMaisApp());
}

class ObraMaisApp extends StatelessWidget {
  const ObraMaisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Obra+ App',
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: true,
      home: const LoginPage(),
    );
  }
}
