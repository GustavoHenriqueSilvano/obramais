import 'package:flutter/material.dart';
// import 'package:obramais/models/menu_block_data.dart';

class HomeContent extends StatelessWidget {
  final VoidCallback onServiceRequestTap;
  final VoidCallback onDashboardTap;
  final VoidCallback onServicesTap;
  final VoidCallback onConversationsTap;
  final VoidCallback onAppointmentsTap;
  final VoidCallback onAccountTap;
  final VoidCallback onLogoutTap; // Adicionado para o item "Sair"

  const HomeContent({
    super.key,
    required this.onServiceRequestTap,
    required this.onDashboardTap,
    required this.onServicesTap,
    required this.onConversationsTap,
    required this.onAppointmentsTap,
    required this.onAccountTap,
    required this.onLogoutTap, // Adicionado
  });

  @override
  Widget build(BuildContext context) {
    final menuItems = [
      _MenuItem(Icons.add_box, 'Solicitar Serviço +', onServiceRequestTap),
      _MenuItem(Icons.dashboard, 'Dashboard', onDashboardTap),
      _MenuItem(Icons.build, 'Serviços', onServicesTap),
      _MenuItem(Icons.chat, 'Conversas', onConversationsTap),
      _MenuItem(Icons.calendar_today, 'Agendamentos', onAppointmentsTap),
      _MenuItem(Icons.person, 'Conta', onAccountTap),
      _MenuItem(Icons.exit_to_app, 'Sair', onLogoutTap), // Item "Sair"
    ];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          children: menuItems.map((item) {
            return InkWell(
              onTap: item.onTap,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 140,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(item.icon, size: 40, color: Colors.green.shade700),
                    const SizedBox(height: 8),
                    Text(
                      item.label,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

// Model para os blocos de menu (simplificado para DartPad)
class _MenuItem {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  _MenuItem(this.icon, this.label, this.onTap);
}
