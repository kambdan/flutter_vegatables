
import 'package:flutter/material.dart';
import 'package:flutter_application_delivery/features/welcome/presentation/utils/color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.context,
    required this.color,
    required this.text,
  });

  final BuildContext context;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.8,
    height: 50, // Altura fija para el botón
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10), // Esto hace que el botón sea redondeado
      boxShadow: [ // Esto agrega la sombra
        BoxShadow(
          color: CustomColors.shadowStartButton, // Color de la sombra
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3), // Posición de la sombra
        ),
      ],
    ),
    child: Material(
      color: color, // Color del botón
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: () {

       Navigator.pushNamed(context, '/home');

          // Acción al presionar el botón
        },
        splashColor: Colors.white.withOpacity(0.5), // Color del efecto ripple
        borderRadius: BorderRadius.circular(10), // Asegura que el efecto ripple tenga bordes redondeados
        child: Center(
          child: Text(
            text, // Texto del botón
            style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold), // Estilo del texto
          ),
        ),
      ),
    ),
  );
}
}
