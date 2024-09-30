import 'package:auth/auth/presentation/auth_images.dart';
import 'package:design_system/design_system.dart';
import 'package:design_system/utils/spacings.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({
    super.key,
    required this.onEnterPressed,
  });

  final VoidCallback onEnterPressed;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.primaryMain,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(x4),
          child: Column(
            children: [
              const SizedBox(height: x4),
              Text(
                'Aprendendo a aprender',
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(height: x8),
              Text(
                'Praticar atividades, um pouco a cada dia ajuda a reter e construir e modelar o aprendizado',
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(height: x10),
              OutlinedButton(
                onPressed: onEnterPressed,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(x12),
                  side: BorderSide(color: theme.colorScheme.white),
                ),
                child: Text(
                  'Entrar',
                  style: theme.textTheme.headLine2.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: x20 + x10),
            ],
          ),
        ),
      ),
    );
  }
}
