import 'package:flutter/material.dart';
import 'package:obramais/services/ranking_star.dart'; // Importa o widget das estrelas

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _nome = "Nome do Prestador/Empresa";
  String _cpfCnpj = "123.456.789-00";
  String _rua = "Rua Exemplo, 123";
  String _bairro = "Bairro Fictício";
  String _cidade = "Cidade Imaginária";
  String _estado = "Estado Legal";
  String _pais = "País da Fantasia";
  final String _tipoTrabalhoExibicao = "Contrato por Hora";

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

  late TextEditingController _nomeController;
  late TextEditingController _cpfCnpjController;
  late TextEditingController _ruaController;
  late TextEditingController _bairroController;
  late TextEditingController _cidadeController;
  late TextEditingController _estadoController;
  late TextEditingController _paisController;

  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
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
    _nomeController.dispose();
    _cpfCnpjController.dispose();
    _ruaController.dispose();
    _bairroController.dispose();
    _cidadeController.dispose();
    _estadoController.dispose();
    _paisController.dispose();
    super.dispose();
  }

  void _toggleEditMode() {
    setState(() {
      _isEditing = !_isEditing;
      if (!_isEditing) {
        _nome = _nomeController.text;
        _cpfCnpj = _cpfCnpjController.text;
        _rua = _ruaController.text;
        _bairro = _bairroController.text;
        _cidade = _cidadeController.text;
        _estado = _estadoController.text;
        _pais = _paisController.text;

        print('Perfil atualizado: $_nome, $_cpfCnpj, $_rua');
      } else {
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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _isEditing ? () => print('Alterar foto de perfil') : null,
              child: const CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, size: 80, color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),

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
            RankingStarsView(rating: _currentRating),
            const SizedBox(height: 20),

            _buildTextField(_cpfCnpjController, 'CPF/CNPJ', Icons.credit_card),
            _buildTextField(_ruaController, 'Rua', Icons.location_on),
            _buildTextField(_bairroController, 'Bairro', Icons.location_city),
            _buildTextField(_cidadeController, 'Cidade', Icons.place),
            _buildTextField(_estadoController, 'Estado', Icons.map),
            _buildTextField(_paisController, 'País', Icons.public),

            const SizedBox(height: 20),

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
            _buildListSection(
              context,
              title: 'Tipo de Serviço Prestado:',
              items: _tiposServicoPrestado,
              showButton: _isEditing,
              buttonText: 'Gerenciar Serviços Prestados',
              onButtonPressed: () => print('Gerenciar Serviços Prestados'),
            ),

            const SizedBox(height: 20),
            _buildListSection(
              context,
              title: 'Normas Reguladoras (NRs):',
              items: _normasReguladoras,
              showButton: _isEditing,
              buttonText: 'Gerenciar NRs',
              onButtonPressed: () => print('Gerenciar NRs'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleEditMode,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        child: Icon(_isEditing ? Icons.save : Icons.edit),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          prefixIcon: Icon(icon),
        ),
        readOnly: !_isEditing,
      ),
    );
  }

  Widget _buildListSection(
    BuildContext context, {
    required String title,
    required List<String> items,
    required bool showButton,
    required String buttonText,
    required VoidCallback onButtonPressed,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(title, style: Theme.of(context).textTheme.titleMedium),
        ),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items
              .map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text('- $item'),
                ),
              )
              .toList(),
        ),
        if (showButton)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
              onPressed: onButtonPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: Text(buttonText),
            ),
          ),
      ],
    );
  }
}
