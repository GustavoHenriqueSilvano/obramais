import 'package:flutter/material.dart';
import 'package:obramais/views/home_content.dart';
import 'package:obramais/widgets/notifications_badge.dart';
import 'package:obramais/views/entidade_page.dart';

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
        onAccountTap: () => debugPrint('Conta clicado'),
      ),
    );
    _pages.add(const Center(child: Text("Buscar")));
    _pages.add(const Center(child: Text("Notificações")));
    _pages.add(const Center(child: Text("Chat")));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Obra+'),
        actions: <Widget>[
          Stack(
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: _onNotificationPressed,
              ),
              NotificationBadge(count: _notificationCount),
            ],
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.build), label: 'Serviços'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Conversas'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Agendamentos',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Conta'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
