import 'package:flutter/material.dart';
import 'package:obramais/services/ranking_star.dart'; // Importe o widget de estrelas

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Dados simulados do perfil. Em um aplicativo real, estes virão de uma Controller futuramente.
  String _nome = "Nome do Prestador/Empresa";
  String _cpfCnpj = "123.456.789-00";
  String _rua = "Rua Exemplo, 123";
  String _bairro = "Bairro Fictício";
  String _cidade = "Cidade Imaginária";
  String _estado = "Estado Legal";
  String _pais = "País da Fantasia";
  final String _tipoTrabalhoExibicao = "Contrato por Hora";

  // Ranqueamento simulado. virá futuramente da controller RankingController.
  final double _currentRating = 3.5;

  final List<String> _tiposServicoPrestado = [
    'Pintura residencial',
    'Pintura industrial',
    'Pintura com detalhamento',
    'Pintura de acabamento',
  ];

  final List<String> _normasReguladoras = [
    'NR-1: Disposições Gerais',
    'NR-10: Segurança em Instalações e Serviços em Eletricidade',
    'NR-35: Trabalho em Altura',
  ];

  // Controladores para os campos de texto editáveis.
  late TextEditingController _nomeController;
  late TextEditingController _cpfCnpjController;
  late TextEditingController _ruaController;
  late TextEditingController _bairroController;
  late TextEditingController _cidadeController;
  late TextEditingController _estadoController;
  late TextEditingController _paisController;

  // Controla o modo de edição da tela.
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    // Inicializa os controladores de texto com os dados simulados.
    _nomeController = TextEditingController(text: _nome);
    _cpfCnpjController = TextEditingController(text: _cpfCnpj);
    _ruaController = TextEditingController(text: _rua);
    _bairroController = TextEditingController(text: _bairro);
    _cidadeController = TextEditingController(text: _cidade);
    _estadoController = TextEditingController(text: _estado);
    _paisController = TextEditingController(text: _pais);
  }

  @override
  void dispose() {
    // Descarta os controladores para liberar recursos.
    _nomeController.dispose();
    _cpfCnpjController.dispose();
    _ruaController.dispose();
    _bairroController.dispose();
    _cidadeController.dispose();
    _estadoController.dispose();
    _paisController.dispose();
    super.dispose();
  }

  // Alterna entre o modo de visualização e edição.
  void _toggleEditMode() {
    setState(() {
      _isEditing = !_isEditing;
      if (!_isEditing) {
        // Quando sai do modo de edição (salvar), atualiza os dados simulados.
        _nome = _nomeController.text;
        _cpfCnpj = _cpfCnpjController.text;
        _rua = _ruaController.text;
        _bairro = _bairroController.text;
        _cidade = _cidadeController.text;
        _estado = _estadoController.text;
        _pais = _paisController.text;

        print('Dados do perfil salvos (simulado):');
        print('Nome: $_nome');
        print('CPF/CNPJ: $_cpfCnpj');
      } else {
        // Quando entra no modo de edição, garante que os controladores refletem os dados atuais.
        _nomeController.text = _nome;
        _cpfCnpjController.text = _cpfCnpj;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meu Perfil'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Foto de Perfil
            GestureDetector(
              onTap: _isEditing
                  ? () {
                      print(
                        'Atualizar foto de perfil (apenas em modo de edição)',
                      );
                    }
                  : null,
              child: const CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, size: 80, color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),

            // Nome do Prestador/Empresa
            _isEditing
                ? TextFormField(
                    controller: _nomeController,
                    decoration: const InputDecoration(
                      labelText: 'Nome do Prestador',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                  )
                : Text(
                    _nome.toUpperCase(),
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
            const SizedBox(height: 10),

            // Ranqueamento em Estrelas
            RankingStarsView(rating: _currentRating),
            const SizedBox(height: 20),

            // Campo CPF/CNPJ
            TextFormField(
              controller: _cpfCnpjController,
              decoration: const InputDecoration(
                labelText: 'CPF/CNPJ',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.credit_card),
              ),
              readOnly: !_isEditing,
            ),
            const SizedBox(height: 15),

            // Campos de Endereço
            TextFormField(
              controller: _ruaController,
              decoration: const InputDecoration(
                labelText: 'Rua',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.location_on),
              ),
              readOnly: !_isEditing,
            ),
            const SizedBox(height: 15),

            TextFormField(
              controller: _bairroController,
              decoration: const InputDecoration(
                labelText: 'Bairro',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.location_city),
              ),
              readOnly: !_isEditing,
            ),
            const SizedBox(height: 15),

            TextFormField(
              controller: _cidadeController,
              decoration: const InputDecoration(
                labelText: 'Cidade',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.place),
              ),
              readOnly: !_isEditing,
            ),
            const SizedBox(height: 15),

            TextFormField(
              controller: _estadoController,
              decoration: const InputDecoration(
                labelText: 'Estado',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.map),
              ),
              readOnly: !_isEditing,
            ),
            const SizedBox(height: 15),

            TextFormField(
              controller: _paisController,
              decoration: const InputDecoration(
                labelText: 'País',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.public),
              ),
              readOnly: !_isEditing,
            ),
            const SizedBox(height: 20),

            // Tipo de Trabalho (somente leitura)
            TextFormField(
              initialValue: _tipoTrabalhoExibicao,
              decoration: const InputDecoration(
                labelText: 'Tipo de Trabalho',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.work),
              ),
              readOnly: true,
            ),
            const SizedBox(height: 20),

            // Tipo de Serviço Prestado
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Tipo de Serviço Prestado:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _tiposServicoPrestado
                  .map(
                    (servico) => Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Text('- $servico'),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 10),
            if (_isEditing)
              ElevatedButton(
                onPressed: () {
                  print('Gerenciar Tipos de Serviço Prestado');
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Gerenciar Serviços Prestados'),
              ),
            const SizedBox(height: 20),

            // Normas Reguladoras (NRs)
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Normas Reguladoras (NRs):',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _normasReguladoras
                  .map(
                    (nr) => Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Text('- $nr'),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 10),
            if (_isEditing)
              ElevatedButton(
                onPressed: () {
                  print('Gerenciar Normas Reguladoras');
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Gerenciar NRs'),
              ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      // Floating Action Button para Editar/Salvar
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleEditMode,
        child: Icon(_isEditing ? Icons.save : Icons.edit),
      ),
    );
  }
}
