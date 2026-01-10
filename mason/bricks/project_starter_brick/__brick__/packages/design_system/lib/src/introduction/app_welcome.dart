import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class AppWelcome extends StatelessWidget {
  const AppWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1A1A1A),
              Color(0xFF2D2D2D),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo or Icon
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.5),
                    width: 2,
                  ),
                ),
                child: const Icon(
                  Icons.design_services_outlined,
                  size: 64,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 32),

              // Title
              Text(
                '{{name.titleCase()}} UI',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: -1.0,
                    ),
              ),
              const SizedBox(height: 16),

              // Subtitle
              Text(
                'A Premium Design System Toolkit',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white70,
                      fontWeight: FontWeight.w300,
                    ),
              ),
              const SizedBox(height: 48),

              // Stats or Info
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _InfoCard(
                    icon: Icons.palette_outlined,
                    label: 'Colors',
                    value: '10+',
                  ),
                  SizedBox(width: 24),
                  _InfoCard(
                    icon: Icons.widgets_outlined,
                    label: 'Components',
                    value: '20+',
                  ),
                  SizedBox(width: 24),
                  _InfoCard(
                    icon: Icons.text_fields,
                    label: 'Typography',
                    value: 'Inter',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.primary, size: 24),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.5),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
