import 'package:flutter/material.dart';

class EntidadeCadastro extends StatefulWidget {
  const EntidadeCadastro({super.key});

  @override
  EntidadeCadastroState createState() => EntidadeCadastroState();
}

class EntidadeCadastroState extends State<EntidadeCadastro> {
  List<String> allItems = [
    'Prestador A',
    'Prestador B',
    'Serviço C',
    'Empresa D',
    'Fornecedor E',
  ];

  List<String> filteredItems = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    filteredItems = allItems;
  }

  void updateSearch(String query) {
    setState(() {
      searchQuery = query;
      filteredItems = allItems
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Prestadores de Serviço')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Buscar Prestadores',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: updateSearch,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Selecionou: $item')),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
