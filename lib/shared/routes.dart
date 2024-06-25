import 'package:flutter_application_delivery/features/home/presentation/pages/home_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

routes() => [
      GetPage(
          name: "/home",
          page: () => const HomePage(),
      )
];