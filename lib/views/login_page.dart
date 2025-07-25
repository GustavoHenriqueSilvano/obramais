import 'package:flutter/material.dart';
import 'package:obramais/views/home_content.dart';
import 'package:obramais/views/entidade_page.dart';
import 'package:obramais/widgets/notifications_badge.dart';
import 'package:obramais/views/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  int _notificationCount = 3;
  final List<Widget> _pages = <Widget>[];

  @override
  void initState() {
    super.initState();
    _pages.add(
      HomeContent(
        onServiceRequestTap: () => debugPrint('Solicitar Serviço + clicado'),
        onDashboardTap: () => debugPrint('Dashboard clicado'),
        onServicesTap: () => debugPrint('Serviços clicado'),
        onConversationsTap: () => debugPrint('Conversas clicado'),
        onAppointmentsTap: () => debugPrint('Agendamentos clicado'),
        onAccountTap: () => _onItemTapped(4),
        onLogoutTap: _logout,
      ),
    );
    _pages.add(const Center(child: Text("Serviços")));
    _pages.add(const Center(child: Text("Conversas")));
    _pages.add(const Center(child: Text("Agendamentos")));
    _pages.add(const EntidadeCadastro());
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onNotificationPressed() {
    setState(() {
      _notificationCount = 0;
      debugPrint('Notificações zeradas');
    });
  }

  void _logout() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Obra+'),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: _onNotificationPressed,
              ),
             
