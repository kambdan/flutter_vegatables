import 'package:flutter/material.dart';
import 'package:flutter_application_delivery/features/welcome/presentation/utils/color.dart';

import '../widgets/custom_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: baseContainer(context),
    );
  }

  Container baseContainer(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Splash.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: detailContainer(context),
    );
  }

  Center detailContainer(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 100), // Espacio entre texto y botones
            Image.asset("assets/sapiens.png"), // Espacio entre imagen y botones
          
            const SizedBox(height: 100), // Espacio entre texto y botones
            CustomButton(context: context, color: CustomColors.startButton, text: "Empezar")
          ],
        ),
      );
  }

}
