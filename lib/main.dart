import 'package:flutter/material.dart';
import 'package:flutter_application_delivery/shared/routes.dart';
import 'features/home/data/impl/product_impl.dart';
import 'features/home/domain/repository/product_repository.dart';
import 'features/home/presentation/provider/product_provider.dart';

import 'package:provider/provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        // Primero, proporcionamos el ProductRepository
        Provider<ProductRepository>(
          create: (_) => ProductImpl(), // Asume que tienes esta implementación
        ),
        // Luego, usamos el ProductRepository para crear el ProductProvider
        ChangeNotifierProxyProvider<ProductRepository, ProductProvider>(
          create: (context) => ProductProvider(
            repo: context.read<ProductRepository>(),
          ),
          update: (context, repo, previous) => 
            previous ?? ProductProvider(repo: repo),
        ),
        // Añade aquí otros providers si los necesitas
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: AppRoutes.routes
    );
  }
}