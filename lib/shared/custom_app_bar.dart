import 'package:flutter/material.dart';
import 'package:flutter_application_delivery/shared/text_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Categorías', style: AppTextStyle.titleAppBar,),
    );
  }
}