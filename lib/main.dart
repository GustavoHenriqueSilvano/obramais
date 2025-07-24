// Importa o pacote de materiais do Flutter para widgets de UI.
import 'package:flutter/material.dart';
// Importa a tela inicial (HomePage) da pasta 'screens'.
import 'views/home_page.dart';

// Função principal que executa o aplicativo Flutter.
void main() {
  // Roda o widget MyApp, que é a raiz da nossa árvore de widgets.
  runApp(const ObraMaisApp());
}

// MyApp é um StatelessWidget, pois não precisa de estado interno mutável.
// Ele define as configurações globais do aplicativo.
class ObraMaisApp extends StatelessWidget {
  const ObraMaisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Título do aplicativo, exibido no gerenciador de tarefas do dispositivo.
      title: 'Obra+ App',
      // Tema visual do aplicativo, aqui definimos a cor primária como verde.
      theme: ThemeData(primarySwatch: Colors.green),
      // Remove o banner de "Debug" no canto superior direito durante o desenvolvimento.
      debugShowCheckedModeBanner: false,
      // Define a tela inicial do aplicativo como HomePage.
      home: const HomePage(),
    );
  }
}
