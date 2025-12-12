import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_portfolio/data/data.dart';
import 'package:my_portfolio/utils/app_colors.dart';
import 'package:my_portfolio/utils/text_styles.dart';
import 'package:my_portfolio/views/components/glass_container.dart';

class LanguagesSection extends StatelessWidget {
  const LanguagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      constraints: const BoxConstraints(maxWidth: 1000),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Languages",
            style: AppTextStyles.header.copyWith(
              fontSize: 40,
              color: AppColors.textPrimary,
            ),
          ).animate().fadeIn().slideY(begin: 0.2, end: 0),
          const SizedBox(height: 40),

          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: PortfolioData.languages
                .map((l) => _buildLanguageChip(l))
                .toList()
                .animate(interval: 50.ms)
                .fadeIn()
                .scale(),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageChip(String language) {
    return GlassContainer(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      borderRadius: 50,
      gradientBorder: LinearGradient(
        colors: [
          Colors.white.withOpacity(0.1),
          Colors.transparent,
          Colors.amberAccent.withOpacity(0.4),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      child: Text(
        language,
        style: AppTextStyles.body.copyWith(
          fontSize: 16, 
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}
