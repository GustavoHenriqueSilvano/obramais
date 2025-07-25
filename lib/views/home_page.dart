import 'package:flutter/material.dart';
import 'package:obramais/views/home_content.dart';
import 'package:obramais/views/login_page.dart';
import 'package:obramais/views/profile_page.dart';
// import 'package:obramais/widgets/notifications_badge.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  int _notificationCount = 3;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomeContent(
        onServiceRequestTap: () => debugPrint('Solicitar Serviço + clicado'),
        onDashboardTap: () => debugPrint('Dashboard clicado'),
        onServicesTap: () => _onItemTapped(1),
        onConversationsTap: () => _onItemTapped(2),
        onAppointmentsTap: () => _onItemTapped(3),
        onAccountTap: () => _onItemTapped(4),
        onLogoutTap: () => _logout(context), // Função de logout no item de menu
      ),
      const Center(child: Text("Serviços")),
      const Center(child: Text("Conversas")),
      const Center(child: Text("Agendamentos")),
      const ProfilePage(), // Página de cadastro de entidade
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onNotificationPressed() {
    setState(() {
      _notificationCount = 0;
    });
  }

  // Função de logout que leva para a página de login
  void _logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
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
              if (_notificationCount > 0)
                Positioned(
                  right: 11,
                  top: 11,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      '$_notificationCount',
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.build), label: 'Serviços'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Conversas'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
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
