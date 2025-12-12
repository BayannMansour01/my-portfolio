import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/data/data.dart';
import 'package:my_portfolio/utils/app_colors.dart';
import 'package:my_portfolio/utils/text_styles.dart';
import 'package:my_portfolio/views/components/glass_container.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      constraints: const BoxConstraints(maxWidth: 1000),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Tech Stack & Skills",
            style: AppTextStyles.header.copyWith(
              fontSize: 40,
              color: AppColors.textPrimary,
            ),
          ).animate().fadeIn().slideY(begin: 0.2, end: 0),
          const SizedBox(height: 60),

          // Tech Skills
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: PortfolioData.techSkills
                .map((skill) => _buildSkillChip(skill))
                .toList()
                .animate(interval: 50.ms)
                .fadeIn()
                .scale(),
          ),

          const SizedBox(height: 60),

          // Soft Skills & Languages (Visual distinction)
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              ...PortfolioData.softSkills.map(
                (s) => _buildTextChip(s, Colors.cyanAccent),
              ),
            ].animate(interval: 50.ms).fadeIn().slideY(begin: 0.2, end: 0),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(Skill skill) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GlassContainer(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        borderRadius: 16,
        gradientBorder: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.1),
            Colors.transparent,
            AppColors.primary.withOpacity(0.3),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (skill.icon != null) ...[
              FaIcon(skill.icon, size: 20, color: AppColors.primary),
              const SizedBox(width: 12),
            ],
            Flexible(
              child: Text(
                skill.name,
                style: AppTextStyles.body.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextChip(String text, Color accent) {
    return GlassContainer(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      borderRadius: 50, // Pill shape
      borderColor: accent.withOpacity(0.3),
      child: Text(text, style: AppTextStyles.body.copyWith(fontSize: 14)),
    );
  }
}
