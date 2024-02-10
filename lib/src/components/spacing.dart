import 'package:flutter/material.dart';
import 'package:stonepro/src/uitls/spacing.dart';

class AppSpacing extends StatelessWidget {
  const AppSpacing({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: appPadding,
      width: appPadding,
    );
  }
}
