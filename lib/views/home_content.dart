import 'package:flutter/material.dart';
import 'package:obramais/models/menu_block_data.dart';

class HomeContent extends StatelessWidget {
  final VoidCallback onServiceRequestTap;
  final VoidCallback onDashboardTap;
  final VoidCallback onServicesTap;
  final VoidCallback onConversationsTap;
  final VoidCallback onAppointmentsTap;
  final VoidCallback onAccountTap;
  final VoidCallback onLogoutTap;

  const HomeContent({
    super.key,
    required this.onServiceRequestTap,
    required this.onDashboardTap,
    required this.onServicesTap,
    required this.onConversationsTap,
    required this.onAppointmentsTap,
    required this.onAccountTap,
    required this.onLogoutTap,
  });

  @override
  Widget build(BuildContext context) {
    final List<MenuBlockData> menuBlocks = [
      MenuBlockData(
        icon: Icons.add_box,
        title: 'Solicitar Serviço +',
        onTap: onServiceRequestTap,
        color: Colors.green.shade300,
      ),
      MenuBlockData(
        icon: Icons.home,
        title: 'Dashboard',
        onTap: onDashboardTap,
      ),
      MenuBlockData(icon: Icons.build, title: 'Serviços', onTap: onServicesTap),
      MenuBlockData(
        icon: Icons.chat,
        title: 'Conversas',
        onTap: onConversationsTap,
      ),
      MenuBlockData(
        icon: Icons.calendar_today,
        title: 'Agendamentos',
        onTap: onAppointmentsTap,
      ),
      MenuBlockData(icon: Icons.person, title: 'Conta', onTap: onAccountTap),
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          children: [
            Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: menuBlocks.map((block) {
                return InkWell(
                  onTap: block.onTap,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: 140,
                    height: 120,
                    decoration: BoxDecoration(
                      color: block.color ?? Colors.green.shade100,
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
                        Icon(
                          block.icon,
                          size: 40,
                          color: Colors.green.shade700,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          block.title,
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
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: onLogoutTap,
              icon: const Icon(Icons.logout),
              label: const Text('Sair'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
