// Importa Flutter y las páginas que usarás
import 'package:flutter/material.dart';

import '../features/home/presentation/pages/home_page_provider.dart';
import '../features/welcome/presentation/pages/welcome_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => const WelcomePage(),
    '/home': (context) => const HomePageProvider(),
  };
}
