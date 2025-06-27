import 'package:flutter/material.dart';

// Mock data for services
class Service {
  final String name;
  final String description;
  final double price;
  final String category;

  Service({required this.name, required this.description, required this.price, required this.category});
}

final List<Service> services = [
  Service(name: 'Consultoria de Negócios', description: 'Análise completa e estratégia para alavancar seu negócio.', price: 2500.00, category: 'Consultoria'),
  Service(name: 'Consultoria de Marketing', description: 'Estratégias de marketing digital para aumentar sua presença online.', price: 1800.00, category: 'Consultoria'),
  Service(name: 'Criação de Logotipo', description: 'Design de logotipo profissional e memorável.', price: 800.00, category: 'Design Gráfico'),
  Service(name: 'Identidade Visual Completa', description: 'Criação de toda a identidade visual da sua marca.', price: 3200.00, category: 'Design Gráfico'),
  Service(name: 'Desenvolvimento de Site Institucional', description: 'Criação de site responsivo e moderno em WordPress.', price: 4500.00, category: 'Desenvolvimento Web'),
  Service(name: 'Desenvolvimento de Loja Virtual', description: 'Plataforma de e-commerce completa para vender seus produtos.', price: 7500.00, category: 'Desenvolvimento Web'),
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Venda de Serviços',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = services.map((s) => s.category).toSet().toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias de Serviços'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return ListTile(
            title: Text(category),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ServiceListPage(category: category),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ServiceListPage extends StatelessWidget {
  final String category;

  const ServiceListPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final categoryServices = services.where((s) => s.category == category).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: ListView.builder(
        itemCount: categoryServices.length,
        itemBuilder: (context, index) {
          final service = categoryServices[index];
          return ListTile(
            title: Text(service.name),
            subtitle: Text('R\$ ${service.price.toStringAsFixed(2)}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ServiceDetailsPage(service: service),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ServiceDetailsPage extends StatelessWidget {
  final Service service;

  const ServiceDetailsPage({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(service.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              service.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Text(
              service.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            Text(
              'Preço: R\$ ${service.price.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Ação do botão
              },
              child: const Text('Solicitar Orçamento'),
            ),
          ],
        ),
      ),
    );
  }
}
