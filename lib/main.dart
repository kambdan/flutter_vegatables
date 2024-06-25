import 'package:flutter/material.dart';
import 'package:flutter_application_delivery/shared/routes.dart';
import 'package:get/get.dart';
import 'features/welcome/presentation/bindings/initial_bindings.dart';
import 'features/welcome/presentation/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: InitialBinding(), // Aquí se especifica el InitialBinding
      home: const WelcomePage(),
      getPages: routes(),
    );
  }
}
