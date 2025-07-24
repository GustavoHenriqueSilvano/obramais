import 'package:flutter/material.dart';
import 'entidade_page.dart';

class PaginaInicial extends StatelessWidget {
  const PaginaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Obra+ - Página Inicial')),
      body: const Center(child: Text('Bem-Vindo ao Obra+!')),

      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.7,
        child: SizedBox(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.green),
                child: Text('Menu'),
              ),

              ListTile(
                leading: Icon(Icons.group),
                title: Text('Prestadores de Serviço'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EntidadeCadastro()),
                  );
                },
              ),

              ListTile(title: Text('Página teste 02'), onTap: null),
              ListTile(title: Text('Página teste 03'), onTap: null),
            ],
          ),
        ),
      ),
    );
  }
}
